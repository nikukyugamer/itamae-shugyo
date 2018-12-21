user 'create USER account' do
  username 'USERNAME'
  password 'PASSWORD' # openssl passwd -1 "Dontaro\!"

  # shell '/usr/bin/zsh' # 対話が発生するので .zshrc を一緒に持っていかないとだめ
  shell '/bin/bash'
  create_home true

  action :create # default: :create

  # userdel USERNAME に「成功したときだけ」、create user USERNAME される（あまり上手い方法ではない……）
  # つまり、もし USERNAME USERNAME を削除してから作り直すということ
  # 冪等でないのでコメントアウト
  # only_if 'userdel USERNAME'
end

execute 'add "sudo" to USERNAME' do
  command 'usermod -aG sudo USERNAME'
end
