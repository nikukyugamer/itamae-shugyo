require 'dotenv/load'

USERNAME = 'deploy_user'.freeze
USER_PUBLIC_KEY_SOURCE_PATH = 'remote_files/deploy_user_authorized_keys.pub'.freeze
SSH_CONFIG_SOURCE_PATH = 'remote_files/ssh_config'.freeze
BASHRC_SOURCE_PATH = 'remote_files/.bashrc'.freeze
INSTALLED_RUBY_VERSION = '2.5.3'.freeze
INSTALLED_GOLANG_VERSION = '1.11.0'.freeze
INSTALLED_NODEJS_VERSION = '11.0.0'.freeze
INSTALLED_PYTHON_VERSION = '3.7.0'.freeze
GOLANG_BINARY_PATH = '/home/deploy_user/.goenv/shims/go'.freeze
GOPATH = "/home/#{USERNAME}/.go".freeze

remote_file "/home/#{USERNAME}/.bashrc" do
  source BASHRC_SOURCE_PATH
  content 'copy bash config file'
  owner USERNAME
  group USERNAME
end

git "/home/#{USERNAME}/.rbenv" do
  user USERNAME
  repository 'https://github.com/sstephenson/rbenv.git'
end

git "/home/#{USERNAME}/.rbenv/plugins/ruby-build" do
  user USERNAME
  repository 'https://github.com/sstephenson/ruby-build.git'
end

git "/home/#{USERNAME}/.goenv" do
  user USERNAME
  repository 'https://github.com/syndbg/goenv.git'
end

git "/home/#{USERNAME}/.ndenv" do
  user USERNAME
  repository 'https://github.com/riywo/ndenv'
end

git "/home/#{USERNAME}/.ndenv/plugins/node-build" do
  user USERNAME
  repository 'https://github.com/riywo/node-build.git'
end

execute 'install pyenv' do
  user USERNAME
  command 'curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash'
end

remote_file "/home/#{USERNAME}/.ssh/authorized_keys" do
  source USER_PUBLIC_KEY_SOURCE_PATH
  content 'copy SSH secret key'
  mode '644'
  owner USERNAME
  group USERNAME
end

# TODO: 秘密鍵のファイルを生で置くのは大変に良くない
# TODO: デフォルトだとログに出力されるので大変に良くない
remote_file "/home/#{USERNAME}/.ssh/deploy_user.pem" do
  source ENV['SOME_SECRET_KEY_PATH']
  content 'copy SSH secret key'
  mode '600'
  owner USERNAME
  group USERNAME
end

remote_file "/home/#{USERNAME}/.ssh/config" do
  source SSH_CONFIG_SOURCE_PATH
  content 'copy SSH config file'
  mode '600'
  owner USERNAME
  group USERNAME
end

execute 'rbenv install & set global' do
  user USERNAME
  command "/home/#{USERNAME}/.rbenv/bin/rbenv install #{INSTALLED_RUBY_VERSION} && /home/#{USERNAME}/.rbenv/bin/rbenv global #{INSTALLED_RUBY_VERSION}"
end

execute 'gem install bundler' do
  user USERNAME
  command "/home/#{USERNAME}/.rbenv/shims/gem install bundler"
end

execute 'ndenv install & set global' do
  user USERNAME
  command "/home/#{USERNAME}/.ndenv/bin/ndenv install #{INSTALLED_NODEJS_VERSION} && /home/#{USERNAME}/.ndenv/bin/ndenv global #{INSTALLED_NODEJS_VERSION}"
end

execute 'pyenv install & set global' do
  user USERNAME
  command "/home/#{USERNAME}/.pyenv/bin/pyenv install #{INSTALLED_PYTHON_VERSION} && /home/#{USERNAME}/.pyenv/bin/pyenv global #{INSTALLED_PYTHON_VERSION}"
end

execute 'goenv install & set global' do
  user USERNAME
  command "/home/#{USERNAME}/.goenv/bin/goenv install #{INSTALLED_GOLANG_VERSION} && /home/#{USERNAME}/.goenv/bin/goenv global #{INSTALLED_GOLANG_VERSION}"
end

directory "/home/#{USERNAME}/.go" do
  action :create
  mode '755'
  owner USERNAME
  group USERNAME
end

directory "/home/#{USERNAME}/.ghq" do
  action :create
  mode '755'
  owner USERNAME
  group USERNAME
end

execute 'install peco, ghq and hub' do
  user USERNAME
  command "GOPATH=#{GOPATH} #{GOLANG_BINARY_PATH} get github.com/peco/peco/cmd/peco && GOPATH=#{GOPATH} #{GOLANG_BINARY_PATH} get github.com/motemen/ghq && GOPATH=#{GOPATH} #{GOLANG_BINARY_PATH} get github.com/github/hub"
end
