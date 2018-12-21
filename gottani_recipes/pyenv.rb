%w(libssl-dev libbz2-dev libreadline-dev libsqlite3-dev sqlite3 libsqlite3-dev).each do |pkg|
  package pkg do
    action :install
  end
end
