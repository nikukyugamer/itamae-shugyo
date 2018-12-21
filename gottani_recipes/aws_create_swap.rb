execute 'On AWS create swap files' do
  command 'dd if=/dev/zero of=/swapfile1 bs=1M count=512 && chmod 600 /swapfile1 && mkswap /swapfile1 && swapon /swapfile1'
end
