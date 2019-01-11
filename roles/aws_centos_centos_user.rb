require 'dotenv/load'

remote_file '/home/centos/.zshrc' do
  source ENV['ZSHRC_FILE']
  content 'Copy zsh config file'
  owner 'centos'
  group 'centos'
end

remote_file '/home/centos/chsh_to_zsh.sh' do
  source '../remote_files/aws_centos/chsh_to_zsh.sh'
  content 'Copy changing shell to zsh file (Shell script)'
  mode '755'
  owner 'centos'
  group 'centos'
end

git '/home/centos/.rbenv' do
  user 'centos'
  repository 'https://github.com/sstephenson/rbenv.git'
end

git '/home/centos/.rbenv/plugins/ruby-build' do
  user 'centos'
  repository 'https://github.com/sstephenson/ruby-build.git'
end

git '/home/centos/.goenv' do
  user 'centos'
  repository 'https://github.com/syndbg/goenv.git'
end

git '/home/centos/.ndenv' do
  user 'centos'
  repository 'https://github.com/riywo/ndenv'
end

git '/home/centos/.ndenv/plugins/node-build' do
  user 'centos'
  repository 'https://github.com/riywo/node-build.git'
end

execute 'install pyenv' do
  user 'centos'
  command 'curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash'
end

# TODO: 秘密鍵のファイルを生で置くのは大変に良くない
# TODO: デフォルトだとログに出力されるので大変に良くない
remote_file "/home/centos/.ssh/#{ENV['GITHUB_SECRET_KEY_FILENAME']}" do
  source ENV['GITHUB_SECRET_KEY']
  content 'Copy GitHub SSH Secret key'
  mode '600'
  owner 'centos'
  group 'centos'
end

remote_file '/home/centos/.ssh/config' do
  source ENV['SSH_CONFIG_FILE']
  content 'Copy SSH config file'
  mode '600'
  owner 'centos'
  group 'centos'
end

execute 'Preparation for installing rbenv' do
  user 'centos'
  command 'sudo yum install -y gcc-6 gcc bzip2 openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel'
end

execute 'rbenv install & set global' do
  user 'centos'
  command "/home/centos/.rbenv/bin/rbenv install -f #{ENV['INSTALLED_RUBY_VERSION']} && /home/centos/.rbenv/bin/rbenv global #{ENV['INSTALLED_RUBY_VERSION']}"
end

execute 'gem install bundler' do
  user 'centos'
  command '/home/centos/.rbenv/shims/gem install bundler'
end

execute 'ndenv install & set global' do
  user 'centos'
  command "/home/centos/.ndenv/bin/ndenv install -f #{ENV['INSTALLED_NODEJS_VERSION']} && /home/centos/.ndenv/bin/ndenv global #{ENV['INSTALLED_NODEJS_VERSION']}"
end

execute 'Preparation for installing pyenv' do
  user 'centos'
  command 'sudo yum install -y gcc zlib-devel bzip2 bzip2-devel readline readline-devel sqlite sqlite-devel openssl openssl-devel git'
end

execute 'pyenv install & set global' do
  user 'centos'
  command "/home/centos/.pyenv/bin/pyenv install -f #{ENV['INSTALLED_PYTHON_VERSION']} && /home/centos/.pyenv/bin/pyenv global #{ENV['INSTALLED_PYTHON_VERSION']}"
end

execute 'goenv install & set global' do
  user 'centos'
  command "/home/centos/.goenv/bin/goenv install -f #{ENV['INSTALLED_GOLANG_VERSION']} && /home/centos/.goenv/bin/goenv global #{ENV['INSTALLED_GOLANG_VERSION']}"
end

directory '/home/centos/.go' do
  action :create
  mode '755'
  owner 'centos'
  group 'centos'
end

directory '/home/centos/.ghq' do
  action :create
  mode '755'
  owner 'centos'
  group 'centos'
end

execute 'Install peco' do
  user 'centos'
  command "GOPATH=/home/centos/#{ENV['GOPATH']} /home/centos/#{ENV['GOLANG_BINARY_PATH']} get github.com/peco/peco/cmd/peco"
end

execute 'Install ghq' do
  user 'centos'
  command "GOPATH=/home/centos/#{ENV['GOPATH']} /home/centos/#{ENV['GOLANG_BINARY_PATH']} get github.com/motemen/ghq"
end

execute 'Install hub' do
  user 'centos'
  command "GOPATH=/home/centos/#{ENV['GOPATH']} /home/centos/#{ENV['GOLANG_BINARY_PATH']} get github.com/github/hub"
end

execute 'Install gomi' do
  user 'centos'
  command "GOPATH=/home/centos/#{ENV['GOPATH']} /home/centos/#{ENV['GOLANG_BINARY_PATH']} get -u github.com/b4b4r07/gomi/..."
end

execute 'Change default shell to zsh' do
  user 'centos'
  command '/home/centos/chsh_to_zsh.sh'
end

file '/home/centos/chsh_to_zsh.sh' do
  action :delete
end
