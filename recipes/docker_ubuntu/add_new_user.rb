user 'create a new user account' do
  username ENV['CREATED_NEW_USERNAME']
  password ENV['CREATED_NEW_USER_PASSWORD']

  shell '/bin/bash'
  create_home true

  action :create
end

# Ubuntu
execute 'add a new user to sudo group' do
  command "usermod -aG sudo #{ENV['CREATED_NEW_USERNAME']}"
end
