#!/bin/bash -xe

expect -c "
spawn /home/ubuntu/.fzf/install
expect \"auto-completion\"
send \"y\n\"
expect \"key bindings\"
send \"y\n\"
expect \"shell configuration files\"
send \"n\n\"
exit 0
"

exit 0
