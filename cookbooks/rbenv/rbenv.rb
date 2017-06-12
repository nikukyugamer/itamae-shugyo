include_recipe '../../secret/username_and_password.rb'
install_ruby_ver = "2.4.1"

package "libssl-dev" do
  action :install
end

package "libreadline-dev" do
  action :install
end

package "zlib1g-dev" do
  action :install
end

execute "git clone rbenv" do
  command "git clone https://github.com/rbenv/rbenv.git /home/#{$username}/.rbenv"
end

execute "chown rbenv dir" do
  command "chown --recursive #{$username}:#{$username} /home/#{$username}/.rbenv"
end

execute "add rbenv path" do
  command "echo 'PATH=/home/#{$username}/.rbenv/bin:$PATH' >> /home/#{$username}/.bashrc"
end

execute "add eval rbenv" do
  command %Q(/bin/bash -lc 'eval "$(/home/#{$username}/.rbenv/libexec/rbenv init -)"')
end

execute "source .bashrc" do
  command %Q(/bin/bash -lc "source /home/#{$username}/.bashrc")
end

execute "git clone ruby-build" do
  command "git clone https://github.com/rbenv/ruby-build.git /home/#{$username}/.rbenv/plugins/ruby-build"
end

execute "install ruby" do
  command %Q(/bin/bash -lc "/home/#{$username}/.rbenv/libexec/rbenv install #{install_ruby_ver}")
end

# more...
# `mkdir`
# `rbenv (local|global) X.X.X`
