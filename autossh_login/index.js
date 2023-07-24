const fs = require('fs')
const {program} = require('commander')
let config_path = '/home/guanzheng/document/script/autossh_login/config/auto_ssh.json';

function get_config_item(config_item) {
    let config_str = fs.readFileSync(config_path, 'utf-8')
    let config_list = JSON.parse(config_str);
    for (let i = 0; i < config_list.length; i++) {
        let tmp = config_list[i]
        if (config_item === tmp.name) {
            if (!tmp.port) tmp.port = 22
            return tmp;
        }
    }
}

function print_config(config_item) {
    let item = get_config_item(config_item);
    if (item && item.name) {
        console.log(`${item.name} ${item.host} ${item.port} ${item.username} ${item.password}`)
    }
}


function print_list() {
    let config_str = fs.readFileSync(config_path, 'utf-8')
    let config_list = JSON.parse(config_str);
    for (let i = 0; i < config_list.length; i++) {
        let tmp = config_list[i]
        if (!tmp.port) tmp.port = 22
        console.log(`name:${tmp.name}\t host:${tmp.host}\t port:${tmp.port}\t description:${tmp.description}`)
    }
}

function print_description(config_item) {
    let item = get_config_item(config_item);
    if (item && item.name) {
        console.log(`name:${item.name}\t host:${item.host}\t port:${item.port}\t description:${item.description}`)
    }
}


program.version('1.0.0')
    .option('-c, --connect [config_item]', 'connect ssh server')
    .option('-l, --list', 'list ssh server')
    .option('-d, --description [config_item]', 'show description')
    .option('-f --config [config_path]', 'config file path')
    .parse(process.argv)
let options = program.opts();
if (options.config) config_path = options.config
if (options.connect) print_config(options.connect);
if (options.list) print_list();
if (options.description) print_description(options.description);
if (Object.keys(options).length === 0 && process.argv[2]) print_config(process.argv[2]);




