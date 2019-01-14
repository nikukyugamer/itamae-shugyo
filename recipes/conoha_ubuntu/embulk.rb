execute 'Install Embulk' do
  user ENV['PROVISIONED_USERNAME']
  command 'curl --create-dirs -o ~/.embulk/bin/embulk -L "https://dl.embulk.org/embulk-latest.jar" && chmod +x ~/.embulk/bin/embulk'
end
