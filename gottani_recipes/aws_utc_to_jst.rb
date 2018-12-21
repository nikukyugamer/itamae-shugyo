execute 'On AWS change Timezone from UTC to JST' do
  command 'cp -p /usr/share/zoneinfo/Japan /etc/localtime'
end
