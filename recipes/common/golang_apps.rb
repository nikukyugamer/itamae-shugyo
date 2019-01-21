if ENV['PROVISIONED_USERNAME'] == 'root'
  PROVISIONED_DIRECTORY = '/root'
else
  PROVISIONED_DIRECTORY = "/home/#{ENV['PROVISIONED_USERNAME']}"
end

directory "#{PROVISIONED_DIRECTORY}/.ghq" do
  action :create
  mode '755'
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end

execute 'Install peco' do
  user ENV['PROVISIONED_USERNAME']
  command "GOPATH=#{PROVISIONED_DIRECTORY}/#{ENV['GOPATH']} #{PROVISIONED_DIRECTORY}/#{ENV['GOLANG_BINARY_PATH']} get github.com/peco/peco/cmd/peco"
end

execute 'Install ghq' do
  user ENV['PROVISIONED_USERNAME']
  command "GOPATH=#{PROVISIONED_DIRECTORY}/#{ENV['GOPATH']} #{PROVISIONED_DIRECTORY}/#{ENV['GOLANG_BINARY_PATH']} get github.com/motemen/ghq"
end

execute 'Install hub' do
  user ENV['PROVISIONED_USERNAME']
  command "GOPATH=#{PROVISIONED_DIRECTORY}/#{ENV['GOPATH']} #{PROVISIONED_DIRECTORY}/#{ENV['GOLANG_BINARY_PATH']} get github.com/github/hub"
end

execute 'Install gomi' do
  user ENV['PROVISIONED_USERNAME']
  command "GOPATH=#{PROVISIONED_DIRECTORY}/#{ENV['GOPATH']} #{PROVISIONED_DIRECTORY}/#{ENV['GOLANG_BINARY_PATH']} get -u github.com/b4b4r07/gomi/..."
end

directory "#{PROVISIONED_DIRECTORY}/.gomi" do
  action :create
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end

remote_file "#{PROVISIONED_DIRECTORY}/.gomi/config.toml" do
  source ENV['GOMI_CONFIG_FILE']
  content 'Copy gomi config file'
  mode '755'
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end
