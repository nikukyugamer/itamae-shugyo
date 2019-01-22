if ENV['PROVISIONED_USERNAME'] == 'root'
  PROVISIONED_DIRECTORY = '/root'
else
  PROVISIONED_DIRECTORY = "/home/#{ENV['PROVISIONED_USERNAME']}"
end

execute 'Build Ruby' do
  user ENV['PROVISIONED_USERNAME']
  command "#{PROVISIONED_DIRECTORY}/.rbenv/bin/rbenv install -f #{ENV['INSTALLED_RUBY_VERSION']}"
end

execute 'Install Ruby' do
  user ENV['PROVISIONED_USERNAME']
  command "#{PROVISIONED_DIRECTORY}/.rbenv/bin/rbenv global #{ENV['INSTALLED_RUBY_VERSION']}"
end

execute 'Install Bundler' do
  user ENV['PROVISIONED_USERNAME']
  command "#{PROVISIONED_DIRECTORY}/.rbenv/shims/gem install bundler"
end
