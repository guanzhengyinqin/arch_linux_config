#!/usr/bin/expect

set SERVER_NAME [lindex $argv 0]
set HOST [lindex $argv 1]
set PORT [lindex $argv 2]
set USER_NAME [lindex $argv 3]
set PASSWORD [lindex $argv 4]

puts "login $SERVER_NAME\n";
spawn ssh -p $PORT $USER_NAME@$HOST

expect {
    -timeout 30
    "*assword" { send "$PASSWORD\n"; exp_continue ; }
    "*yes/no*" { send yes\n; exp_continue; }
    "Last*" {
        # 设置颜色和样式
        send "NC='\\e\[0m\\\]' # 恢复默认颜色\r"
        send "RED='\\e\[0;31m\\\]'\r"
        send "GREEN='\\e\[0;32m\\\]'\r"
        send "YELLOW='\\e\[0;33m\\\]'\r"
        send "BLUE='\\e\[0;34m\\\]'\r"
        send "PURPLE='\\e\[0;35m\\\]'\r"
        send "CYAN='\\e\[0;36m\\\]'\r"
        send "WHITE='\\e\[0;37m\\\]'\r"
        send "BOLD='\\e\[1m\\\]'\r"
        send "UNDERLINE='\\e\[4m\\\]'\r"

        # 设置命令提示符
            send "PS1=\"\${BOLD}\${RED}\\u \${YELLOW}@ \${GREEN}$SERVER_NAME  \${YELLOW}\\w \${CYAN}\$(git branch 2>/dev/null | grep -e '^*' | sed 's/^* //')\${NC}\\n\\$ \"\r"
            puts "login success\n";
        }
    timeout { puts "Expect was timeout."; return }
}

interact
