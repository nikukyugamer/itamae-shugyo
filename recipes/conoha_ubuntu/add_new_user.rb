if ENV['CREATED_NEW_USERNAME'] == 'root'
  PROVISIONED_DIRECTORY = '/root'
else
  PROVISIONED_DIRECTORY = "/home/#{ENV['CREATED_NEW_USERNAME']}"
end

user 'Create a new user account' do
  username ENV['CREATED_NEW_USERNAME']
  password ENV['CREATED_NEW_USER_PASSWORD']

  shell '/bin/bash'
  create_home true

  action :create
end

execute 'Add a new user to sudo group' do
  command "usermod -aG sudo #{ENV['CREATED_NEW_USERNAME']}"
end

execute 'Create .ssh directory if it does not exist' do
  user ENV['PROVISIONED_USERNAME']
  command "mkdir -p #{PROVISIONED_DIRECTORY}/.ssh"
end

remote_file "#{PROVISIONED_DIRECTORY}/.ssh/authorized_keys" do
  source ENV['PROVISIONED_USER_PUBLIC_KEY_FILE']
  content 'Copy SSH authorized_keys'
  mode '600'
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end
