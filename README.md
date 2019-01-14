# How to use

## Sa-ba-ku
- Sa-ba-ku with `.env`

```bash
$ export $(cat .env | grep -v ^# | xargs); ./sabaku.sh
```

## Preparation
- Create YOUR `.env`
    - cf. [.env.sample](/.env.sample)

- Global install is required.

```bash
$ gem install itamae

# For Ed25519
$ gem install ed25519
$ gem install bcrypt_pbkdf

$ gem install dotenv
```

# Create remote files (Optional)
- If you wanna copy `/source_path/to` to remote machine's `/target_path/to`, please write as below

```ruby
remote_file '/target_path/to' do
  source '/source_path/to'
  content 'Describe detail'
  owner 'root'
  group 'root'
end
```

# What's this?
- My [Itamae](http://itamae.kitchen/) recipes
- Now the recipes are not [best practice](https://github.com/itamae-kitchen/itamae/wiki/Best-Practice) but bad practice

# Tips for `Sa-ba-ku`
- The word `sabaku` which contains in `sabaku.sh` is Japanese verb word `捌く(Sa-ba-ku)`, which means `to deal with foodstuff well`
    - [Example image](http://livedoor.blogimg.jp/maamee123/imgs/b/f/bf9923eb.jpg)

# Note
- I've been training as `Itamae`, that is `SHUGYO-CHU` (under training)
    - So this repository name is `Itamae Shugyo`
- [best practice](https://github.com/itamae-kitchen/itamae/wiki/Best-Practice)

# Thanks
- [Best Practice · itamae-kitchen/itamae Wiki](https://github.com/itamae-kitchen/itamae/wiki/Best-Practice)
- [Chef脱落者が、Itamaeで快適インフラ生活する話](http://qiita.com/zaru/items/8ae6182e544aac6f6d79)
- [Itamaeチートシート](http://qiita.com/fukuiretu/items/170aa956731f2ffb5715)

# TODO
- 冪等 (Idempotent) になるように修正する
    - 例えば、AWS ならば swapfile の存否で分岐させる
- 粒度と DRY を意識したリファクタリング

## Additional recipe
- Some recipes for `arm (Raspberry Pi)`
- A role for ConoHa
- [git-lfs](https://github.com/git-lfs/git-lfs/wiki/Installation)
- nginx
- redis
- tig
- mongodb
- heroku-cli

# How to provision to ConoHa via GUI
## Ubuntu case (Username is ubuntu)
- `Add Server` with `SSH Key` option
- Login console by `root` (With either web browser or terminal)
- Execute below commands

```bash
# adduser ubuntu
# echo ubuntu ALL=NOPASSWD: ALL >> /etc/sudoers
# mkdir /home/ubuntu/.ssh
# chown ubuntu:ubuntu /home/ubuntu/.ssh && chmod 700 /home/ubuntu/.ssh
# cp /root/.ssh/authorized_keys /home/ubuntu/.ssh
# chown ubuntu:ubuntu /home/ubuntu/.ssh/authorized_keys && chmod 600 /home/ubuntu/.ssh/authorized_keys
```

- Do Itamae with SSH Key
    - Confirm server's IP Address

# LICENSE
- [MIT License](/LICENSE)
