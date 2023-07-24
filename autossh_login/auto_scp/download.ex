#!/usr/bin/expect
set timeout -1
set HOST [lindex $argv 0]
set PORT [lindex $argv 1]
set USER_NAME [lindex $argv 2]
set PASSWORD [lindex $argv 3]
set REMOTE_FILE [lindex $argv 4]
set LOCAL_FILE [lindex $argv 5]
set DIRECTORY [lindex $argv 6]

if {$DIRECTORY == "-r"} {
  spawn scp -r -P $PORT $USER_NAME@$HOST:$REMOTE_FILE $LOCAL_FILE
} else {
  spawn scp -P $PORT $USER_NAME@$HOST:$REMOTE_FILE $LOCAL_FILE
}

expect {
    "*assword" { send "$PASSWORD\n"; exp_continue ; }
    "*yes/no*" { send yes\n; exp_continue; }
}
exit