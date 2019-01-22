execute 'Initial apt-get update' do
  command 'apt-get update -y'
end

execute 'Initial apt-get dist-upgrade' do
  # "DEBIAN_FRONTEND=noninteractive" and "sudo -E" are for avoiding a interactive installation of "ssh-server" and "grub"
  command 'DEBIAN_FRONTEND=noninteractive sudo -E apt-get dist-upgrade -y'
end

%w(language-pack-ja language-pack-ja-base).each do |pkg|
  package pkg do
    action :install
  end
end

%w(manpages-ja build-essential apache2-utils wget curl zip unzip git software-properties-common).each do |pkg|
  package pkg do
    action :install
  end
end

%w(wget curl zip unzip git vim expect).each do |pkg|
  package pkg do
    action :install
  end
end

# Preparation for building Ruby
%w(autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev).each do |pkg|
  package pkg do
    action :install
  end
end

# Preparation for building Python
%w(make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev).each do |pkg|
  package pkg do
    action :install
  end
end

%w(wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl).each do |pkg|
  package pkg do
    action :install
  end
end

execute 'Clean package manager' do
  command 'apt-get autoremove -y && sudo apt-get autoclean -y'
end

