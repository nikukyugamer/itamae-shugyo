#!/bin/bash -xe

echo "/usr/bin/zsh" | sudo tee -a /etc/shells
sudo chsh ubuntu -s /usr/bin/zsh

exit 0
