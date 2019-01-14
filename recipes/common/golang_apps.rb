directory "/home/#{ENV['PROVISIONED_USERNAME']}/.ghq" do
  action :create
  mode '755'
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end

execute 'Install peco' do
  user ENV['PROVISIONED_USERNAME']
  command "GOPATH=/home/#{ENV['PROVISIONED_USERNAME']}/#{ENV['GOPATH']} /home/#{ENV['PROVISIONED_USERNAME']}/#{ENV['GOLANG_BINARY_PATH']} get github.com/peco/peco/cmd/peco"
end

execute 'Install ghq' do
  user ENV['PROVISIONED_USERNAME']
  command "GOPATH=/home/#{ENV['PROVISIONED_USERNAME']}/#{ENV['GOPATH']} /home/#{ENV['PROVISIONED_USERNAME']}/#{ENV['GOLANG_BINARY_PATH']} get github.com/motemen/ghq"
end

execute 'Install hub' do
  user ENV['PROVISIONED_USERNAME']
  command "GOPATH=/home/#{ENV['PROVISIONED_USERNAME']}/#{ENV['GOPATH']} /home/#{ENV['PROVISIONED_USERNAME']}/#{ENV['GOLANG_BINARY_PATH']} get github.com/github/hub"
end

execute 'Install gomi' do
  user ENV['PROVISIONED_USERNAME']
  command "GOPATH=/home/#{ENV['PROVISIONED_USERNAME']}/#{ENV['GOPATH']} /home/#{ENV['PROVISIONED_USERNAME']}/#{ENV['GOLANG_BINARY_PATH']} get -u github.com/b4b4r07/gomi/..."
end

directory "/home/#{ENV['PROVISIONED_USERNAME']}/.gomi" do
  action :create
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end

remote_file "/home/#{ENV['PROVISIONED_USERNAME']}/.gomi/config.toml" do
  source ENV['GOMI_CONFIG_FILE']
  content 'Copy gomi config file'
  mode '755'
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end
