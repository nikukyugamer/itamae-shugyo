#!/bin/bash -xe

sudo apt-get install -y language-pack-ja language-pack-ja-base && sudo apt-get update -y && sudo apt-mark hold grub-pc -y && sudo apt-get dist-upgrade -y && sudo apt-mark unhold grub-pc  -y && sudo apt-get -y install manpages-ja build-essential apache2-utils wget curl zip unzip git software-properties-common zsh

# bundle exec itamae ssh -u USERNAME -h gba-second.amilab.tokyo -i ~/.ssh/keys/goodbye-amiami-second.USERNAME.pem --log-level=DEBUG --color initialize.rb
# bundle exec itamae ssh -u USERNAME -h gba-second.amilab.tokyo -i ~/.ssh/keys/goodbye-amiami-second.USERNAME.pem --log-level=DEBUG --color mysql.rb
# bundle exec itamae ssh -u USERNAME -h gba-second.amilab.tokyo -i ~/.ssh/keys/goodbye-amiami-second.USERNAME.pem --log-level=DEBUG --color nginx.rb

# bundle exec itamae ssh -u USERNAME -h gba-second.amilab.tokyo -i ~/.ssh/keys/goodbye-amiami-second.USERNAME.pem --log-level=DEBUG --color rbenv.rb
# bundle exec itamae ssh -u USERNAME -h gba-second.amilab.tokyo -i ~/.ssh/keys/goodbye-amiami-second.USERNAME.pem --log-level=DEBUG --color aws_utc_to_jst.rb

exit 0
