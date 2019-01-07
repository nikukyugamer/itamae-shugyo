# TODO: date コマンドなどでの UTC -> JST の組み込み（再起動後も維持されるような）
# TODO: SSH の永続化設定
# /etc/ssh/sshd_config
# #ClientAliveInterval 0 -> ClientAliveInterval 60

%w(language-pack-ja language-pack-ja-base).each do |pkg|
  package pkg do
    action :install
  end
end

execute 'initial apt-get' do
  # apt-mark は苦肉の策
  command 'sudo apt-get update -y && sudo apt-mark hold grub-pc && sudo apt-get dist-upgrade -y && sudo apt-mark unhold grub-pc'
end

%w(manpages-ja build-essential apache2-utils wget curl zip unzip git software-properties-common zsh).each do |pkg|
  package pkg do
    action :install
  end
end

execute 'update locale to ja' do
  command 'sudo update-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja"'
end

execute 'Change Timezone to Asia/Tokyo' do
  command 'sudo timedatectl set-timezone Asia/Tokyo'
end

execute '. /etc/default/locale' do
  action :run
end

THIS_HOSTNAME = 'FOOBAR_HOST'.freeze
execute 'create hostname' do
  command "rm /etc/hostname && echo #{THIS_HOSTNAME} > /etc/hostname"
end

execute 'after procedure' do
  command 'sudo apt-get autoremove -y && sudo apt-get autoclean -y'
end
