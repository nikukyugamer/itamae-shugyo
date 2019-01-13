execute 'Create hostname' do
  command "hostnamectl set-hostname #{ENV['HOSTNAME']}"
end
