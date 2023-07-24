const fs = require('fs');

if(process.argv.length>2){
    const json_file_path = process.argv[2]
    const config_str = fs.readFileSync(json_file_path, 'utf-8')
    const config_list = JSON.parse(config_str);
    let candidate = '';
    for (let i = 0; i < config_list.length; i++) {
        let item = config_list[i]
        if(i<config_list.length-1){
            candidate += `@${item.name},`
        }else{
            candidate += `@${item.name}`
        }
    }
    console.log(`${candidate}`)
}

