const fs = require('fs');


let config_path = '/home/guanzheng/document/script/autossh_login/config/auto_ssh.json';
let par_index = 2;
let is_directory = false;
if (process.argv[2] === '-r') {
    is_directory = true;
    par_index = 3;
}

let cp1 = process.argv[par_index];
let cp2 = process.argv[par_index + 1];
if (process.argv[par_index + 2]) {
    config_path = process.argv[par_index + 2]
}

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


if (cp1.includes(':') && cp2.includes(':')) {
    let server_name = cp1.split(':')[0];
    server_name = server_name.replace(new RegExp("@"),"")
    let file_path = cp1.split(':')[1];
    let target_server_name = cp1.split(':')[0];
    let target_file_path = cp1.split(':')[1];

    let source_config = get_config_item(server_name);
    if (!source_config.port) source_config.port = 22

    let target_config = get_config_item(target_server_name);
    if (!target_config.port) target_config.port = 22

    console.log(`remote ${source_config.host} ${source_config.port} ${source_config.username} ${source_config.password} ${file_path} ${target_config.host} ${target_config.port} ${target_config.username} ${target_config.password} ${target_file_path}  ${is_directory ? '-r' : ''}`)
} else if (cp1.includes(':')) {
    let server_name = cp1.split(':')[0];
    server_name = server_name.replace(new RegExp("@"),"")
    let file_path = cp1.split(':')[1];
    let config_item = get_config_item(server_name);
    if (!config_item.port) config_item.port = 22
    console.log(`download ${config_item.host} ${config_item.port} ${config_item.username} ${config_item.password} ${file_path} ${cp2} ${is_directory ? '-r' : ''}`)
} else if (cp2.includes(':')) {
    let server_name = cp2.split(':')[0];
    server_name = server_name.replace(new RegExp("@"),"")
    let file_path = cp2.split(':')[1];
    let config_item = get_config_item(server_name);
    if (!config_item.port) config_item.port = 22
    console.log(`upload ${config_item.host} ${config_item.port} ${config_item.username} ${config_item.password} ${cp1} ${file_path} ${is_directory ? '-r' : ''}`)
}
