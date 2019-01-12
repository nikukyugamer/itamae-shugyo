git "/home/#{ENV['PROVISIONED_USERNAME']}/.goenv" do
  user ENV['PROVISIONED_USERNAME']
  repository 'https://github.com/syndbg/goenv.git'
end

execute 'Build Golang' do
  user ENV['PROVISIONED_USERNAME']
  command "/home/#{ENV['PROVISIONED_USERNAME']}/.goenv/bin/goenv install -f #{ENV['INSTALLED_GOLANG_VERSION']}"
end

execute 'Install Golang' do
  user ENV['PROVISIONED_USERNAME']
  command "/home/#{ENV['PROVISIONED_USERNAME']}/.goenv/bin/goenv global #{ENV['INSTALLED_GOLANG_VERSION']}"
end

directory "/home/#{ENV['PROVISIONED_USERNAME']}/.go" do
  action :create
  mode '755'
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end
