#!/bin/bash -xe

echo "/usr/bin/zsh" | sudo tee -a /etc/shells

expect -c "
spawn sudo chsh centos
expect \"New shell\"
send \"\/usr\/bin\/zsh\\n\"
"

exit 0