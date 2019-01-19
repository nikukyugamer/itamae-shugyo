execute 'Install Heroku CLI' do
  user ENV['PROVISIONED_USERNAME']
  command 'curl https://cli-assets.heroku.com/install-ubuntu.sh | sh'
end
