# https://github.com/rbenv/ruby-build/wiki
# Depending on your version of Ubuntu/Debian/Mint, libgdbm5 won't be available. In that case, try with libgdbm3.

%w(autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev).each do |pkg|
  package pkg do
    action :install
  end
end
