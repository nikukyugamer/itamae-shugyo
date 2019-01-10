execute 'Initial yum' do
  command 'yum update -y'
end

%w(wget curl zip unzip git zsh).each do |pkg|
  package pkg do
    action :install
  end
end

execute 'Change Timezone to Asia/Tokyo' do
  command 'timedatectl set-timezone Asia/Tokyo'
end

execute 'Clean package manager' do
  command 'yum autoremove && yum clean all'
end

# For Amazon Web Services
execute 'Create swap area' do
  command 'dd if=/dev/zero of=/swapfile1 bs=1M count=512 && chmod 600 /swapfile1 && mkswap /swapfile1 && swapon /swapfile1'
end
