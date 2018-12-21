%w(nginx).each do |pkg|
  package pkg do
    action :install
  end
end

# conf コピー
# nginx 再起動
# sudo apt install apache2-utils