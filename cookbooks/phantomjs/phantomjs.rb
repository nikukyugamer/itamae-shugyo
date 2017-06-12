package "npm" do
  action :install
end

package "nodejs-legacy" do
  action :install
end

execute "install_phantomjs" do
  command "sudo npm install phantomjs"
end
