require 'dotenv/load'

remote_file "/home/#{ENV['USERNAME']}/.zshrc" do
  source ENV['ZSHRC_FILE']
  content 'Copy zsh config file'
  owner ENV['USERNAME']
  group ENV['USERNAME']
end

git "/home/#{ENV['USERNAME']}/.rbenv" do
  user ENV['USERNAME']
  repository 'https://github.com/sstephenson/rbenv.git'
end

git "/home/#{ENV['USERNAME']}/.rbenv/plugins/ruby-build" do
  user ENV['USERNAME']
  repository 'https://github.com/sstephenson/ruby-build.git'
end

git "/home/#{ENV['USERNAME']}/.goenv" do
  user ENV['USERNAME']
  repository 'https://github.com/syndbg/goenv.git'
end

git "/home/#{ENV['USERNAME']}/.ndenv" do
  user ENV['USERNAME']
  repository 'https://github.com/riywo/ndenv'
end

git "/home/#{ENV['USERNAME']}/.ndenv/plugins/node-build" do
  user ENV['USERNAME']
  repository 'https://github.com/riywo/node-build.git'
end

execute 'install pyenv' do
  user ENV['USERNAME']
  command 'curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash'
end

remote_file "/home/#{ENV['USERNAME']}/.ssh/authorized_keys" do
  source ENV['USER_PUBLIC_KEY_SOURCE_PATH']
  content 'Copy SSH secret key'
  mode '644'
  owner ENV['USERNAME']
  group ENV['USERNAME']
end

# TODO: 秘密鍵のファイルを生で置くのは大変に良くない
# TODO: デフォルトだとログに出力されるので大変に良くない
# remote_file "/home/#{ENV['USERNAME']}/.ssh/deploy_user.pem" do
#   source ENV['SOME_SECRET_KEY_PATH']
#   content 'Copy SSH secret key'
#   mode '600'
#   owner ENV['USERNAME']
#   group ENV['USERNAME']
# end

remote_file "/home/#{ENV['USERNAME']}/.ssh/config" do
  source ENV['SSH_CONFIG_FILE']
  content 'copy SSH config file'
  mode '600'
  owner ENV['USERNAME']
  group ENV['USERNAME']
end

execute 'rbenv install & set global' do
  user ENV['USERNAME']
  command "/home/#{ENV['USERNAME']}/.rbenv/bin/rbenv install #{INSTALLED_RUBY_VERSION} && /home/#{ENV['USERNAME']}/.rbenv/bin/rbenv global #{INSTALLED_RUBY_VERSION}"
end

execute 'gem install bundler' do
  user ENV['USERNAME']
  command "/home/#{ENV['USERNAME']}/.rbenv/shims/gem install bundler"
end

execute 'ndenv install & set global' do
  user ENV['USERNAME']
  command "/home/#{ENV['USERNAME']}/.ndenv/bin/ndenv install #{INSTALLED_NODEJS_VERSION} && /home/#{ENV['USERNAME']}/.ndenv/bin/ndenv global #{INSTALLED_NODEJS_VERSION}"
end

execute 'pyenv install & set global' do
  user ENV['USERNAME']
  command "/home/#{ENV['USERNAME']}/.pyenv/bin/pyenv install #{INSTALLED_PYTHON_VERSION} && /home/#{ENV['USERNAME']}/.pyenv/bin/pyenv global #{INSTALLED_PYTHON_VERSION}"
end

execute 'goenv install & set global' do
  user ENV['USERNAME']
  command "/home/#{ENV['USERNAME']}/.goenv/bin/goenv install #{INSTALLED_GOLANG_VERSION} && /home/#{ENV['USERNAME']}/.goenv/bin/goenv global #{INSTALLED_GOLANG_VERSION}"
end

directory "/home/#{ENV['USERNAME']}/.go" do
  action :create
  mode '755'
  owner ENV['USERNAME']
  group ENV['USERNAME']
end

directory "/home/#{ENV['USERNAME']}/.ghq" do
  action :create
  mode '755'
  owner ENV['USERNAME']
  group ENV['USERNAME']
end

execute 'Install peco' do
  user ENV['USERNAME']
  command "GOPATH=/home/#{ENV['USERNAME']}/#{GOPATH} /home/#{ENV['USERNAME']}/#{GOLANG_BINARY_PATH} get github.com/peco/peco/cmd/peco"
end

execute 'Install ghq' do
  user ENV['USERNAME']
  command "GOPATH=/home/#{ENV['USERNAME']}/#{GOPATH} /home/#{ENV['USERNAME']}/#{GOLANG_BINARY_PATH} get github.com/motemen/ghq"
end

execute 'Install hub' do
  user ENV['USERNAME']
  command "GOPATH=/home/#{ENV['USERNAME']}/#{GOPATH} /home/#{ENV['USERNAME']}/#{GOLANG_BINARY_PATH} get github.com/github/hub"
end

execute 'Install gomi' do
  user ENV['USERNAME']
  command "GOPATH=/home/#{ENV['USERNAME']}/#{GOPATH} /home/#{ENV['USERNAME']}/#{GOLANG_BINARY_PATH} get -u github.com/b4b4r07/gomi/..."
end
