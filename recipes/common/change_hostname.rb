execute 'Create hostname' do
  command "sudo hostnamectl set-hostname #{ENV['HOSTNAME']}"
end
