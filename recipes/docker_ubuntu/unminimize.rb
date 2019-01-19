remote_file "/home/#{ENV['PROVISIONED_USERNAME']}/unminimize.sh" do
  source ENV['UNMINIMIZE_SCRIPT']
  content 'Copy a shell scirpt of unminimize'
  mode '755'
  owner ENV['PROVISIONED_USERNAME']
  group ENV['PROVISIONED_USERNAME']
end

execute 'Execute unminimize command' do
  user ENV['PROVISIONED_USERNAME']
  command "/home/#{ENV['PROVISIONED_USERNAME']}/unminimize.sh"
end

file "/home/#{ENV['PROVISIONED_USERNAME']}/unminimize.sh" do
  action :delete
end
