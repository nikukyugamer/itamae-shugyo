#!/bin/bash -xe

echo "/usr/bin/zsh" | sudo tee -a /etc/shells
sudo chsh centos -s /usr/bin/zsh

exit 0
