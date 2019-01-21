if ENV['PROVISIONED_USERNAME'] == 'root'
  PROVISIONED_DIRECTORY = '/root'
else
  PROVISIONED_DIRECTORY = "/home/#{ENV['PROVISIONED_USERNAME']}"
end

git "#{PROVISIONED_DIRECTORY}/.goenv" do
  user ENV['PROVISIONED_USERNAME']
  repository 'https://github.com/syndbg/goenv.git'
end

execute 'Build Golang' do
  user ENV['PROVISIONED_USERNAME']
  command "#{PROVISIONED_DIRECTORY}/.goenv/bin/goenv install -f #{ENV['INSTALLED_GOLANG_VERSION']}"
end

execute 'Install Golang' do
  user ENV['PROVISIONED_USERNAME']
  command "#{PROVISIONED_DIRECTORY}/.goenv/bin/goenv global #{ENV['INSTALLED_GOLANG_VERSION']}"
end

directory "#{PROVISIONED_DIRECTORY}/.go" do
  action :create
  mode '755'
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end
