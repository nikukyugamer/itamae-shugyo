git "/home/#{ENV['PROVISIONED_USERNAME']}/.rbenv" do
  user ENV['PROVISIONED_USERNAME']
  repository 'https://github.com/sstephenson/rbenv.git'
end

git "/home/#{ENV['PROVISIONED_USERNAME']}/.rbenv/plugins/ruby-build" do
  user ENV['PROVISIONED_USERNAME']
  repository 'https://github.com/sstephenson/ruby-build.git'
end

execute 'Build Ruby' do
  user ENV['PROVISIONED_USERNAME']
  command "/home/#{ENV['PROVISIONED_USERNAME']}/.rbenv/bin/rbenv install -f #{ENV['INSTALLED_RUBY_VERSION']}"
end

execute 'Install Ruby' do
  user ENV['PROVISIONED_USERNAME']
  command "/home/#{ENV['PROVISIONED_USERNAME']}/.rbenv/bin/rbenv global #{ENV['INSTALLED_RUBY_VERSION']}"
end

execute 'Install Bundler' do
  user ENV['PROVISIONED_USERNAME']
  command "/home/#{ENV['PROVISIONED_USERNAME']}/.rbenv/shims/gem install bundler"
end
