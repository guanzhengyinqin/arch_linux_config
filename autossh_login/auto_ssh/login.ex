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
    "*#" {
        #send "PS1=\'\[\\\[\\e\[33;40m\\\]\\u@$SERVER_NAME\\w\\A\]\\$\'\n";
        #send "PS1=\'\\e\[33;1m\\\]\[\\u@$SERVER_NAME \\w \\d \\A\]\\$\\\[\\e\[0m\\\]\ '\n";
        send "PS1=\'\\\[\\e\[1;35m\\\]\\u@$SERVER_NAME\\\[\\e\[0m\\\]:\\\[\\e\[33m\\\]\\w\\\[\\e\[0m\\\]\\\[\\e\[34m\\\]\\\$\\\[\\e\[0m\\\]\' \n"
        puts "login success\n";
    }
    "*\\$" {
            send "PS1=\'\\\[\\e\[1;35m\\\]\\u@$SERVER_NAME\\\[\\e\[0m\\\]:\\\[\\e\[33m\\\]\\w\\\[\\e\[0m\\\]\\\[\\e\[34m\\\]\\\$\\\[\\e\[0m\\\]\' \n"
            puts "login success\n";
        }
    timeout { puts "Expect was timeout."; return }
}

interact
