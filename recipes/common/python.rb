if ENV['PROVISIONED_USERNAME'] == 'root'
  PROVISIONED_DIRECTORY = '/root'
else
  PROVISIONED_DIRECTORY = "/home/#{ENV['PROVISIONED_USERNAME']}"
end

execute 'Build Python' do
  user ENV['PROVISIONED_USERNAME']
  command "#{PROVISIONED_DIRECTORY}/.pyenv/bin/pyenv install -f #{ENV['INSTALLED_PYTHON_VERSION']}"
end

execute 'Install Python' do
  user ENV['PROVISIONED_USERNAME']
  command "#{PROVISIONED_DIRECTORY}/.pyenv/bin/pyenv global #{ENV['INSTALLED_PYTHON_VERSION']}"
end
