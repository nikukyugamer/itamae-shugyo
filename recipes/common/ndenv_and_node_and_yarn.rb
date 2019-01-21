if ENV['PROVISIONED_USERNAME'] == 'root'
  PROVISIONED_DIRECTORY = '/root'
else
  PROVISIONED_DIRECTORY = "/home/#{ENV['PROVISIONED_USERNAME']}"
end

git "#{PROVISIONED_DIRECTORY}/.ndenv" do
  user ENV['PROVISIONED_USERNAME']
  repository 'https://github.com/riywo/ndenv'
end

git "#{PROVISIONED_DIRECTORY}/.ndenv/plugins/node-build" do
  user ENV['PROVISIONED_USERNAME']
  repository 'https://github.com/riywo/node-build.git'
end

execute 'Build Node.js' do
  user ENV['PROVISIONED_USERNAME']
  command "#{PROVISIONED_DIRECTORY}/.ndenv/bin/ndenv install -f #{ENV['INSTALLED_NODEJS_VERSION']}"
end

execute 'Install Node.js' do
  user ENV['PROVISIONED_USERNAME']
  command "#{PROVISIONED_DIRECTORY}/.ndenv/bin/ndenv global #{ENV['INSTALLED_NODEJS_VERSION']}"
end

execute 'Install Yarn' do
  user ENV['PROVISIONED_USERNAME']
  command "#{PROVISIONED_DIRECTORY}/.ndenv/shims/npm install -g yarn"
end
