#!/usr/bin/expect
set timeout 20

set HOST [lindex $argv 0]
set PORT [lindex $argv 1]
set USER_NAME [lindex $argv 2]
set PASSWORD [lindex $argv 3]
set FILE [lindex $argv 4]

set TARGET_HOST [lindex $argv 5]
set TARGET_PORT [lindex $argv 6]
set TARGET_USER_NAME [lindex $argv 7]
set TARGET_PASSWORD [lindex $argv 8]
set TARGET_FILE [lindex $argv 9]

set DIRECTORY [lindex $argv 10]

puts "remote scp \n";
spawn ssh -p $PORT $USER_NAME@$HOST

expect {
  "yes/no" {send "yes\n";exp_continue}
  "password:" {send "$PASSWORD\n"}
}
expect "]*"
send "lsof -i:80\n"
expect "]*"
send "exit\n"




