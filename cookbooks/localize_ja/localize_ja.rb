execute "set-timezone" do
  command "sudo timedatectl set-timezone Asia/Tokyo"
end

package "language-pack-ja" do
  action :install
end

package "manpages-ja" do
  action :install
end

package "manpages-ja-dev" do
  action :install
end

execute "update-locale" do
  command "sudo update-locale LANG=ja_JP.UTF-8"
end
