# How to use
Global install is required.

```bash
$ gem install itamae

# For Ed25519
$ gem install ed25519
$ gem install bcrypt_pbkdf

$ gem install dotenv
```

# Remote files
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

# Tips for `Sa-Ba-Ku`
- The word `sabaku` which contains in `sabaku.sh` is Japanese verb word `捌く(Sa-Ba-Ku)`, which means `to deal with foodstuff well`
    - [Example image](http://livedoor.blogimg.jp/maamee123/imgs/b/f/bf9923eb.jpg)

# Note
- I've been training as `Itamae`, that is `SHUGYO-CHU` (under training)
    - So this repository name is `Itamae Shugyo`
- [best practice](https://github.com/itamae-kitchen/itamae/wiki/Best-Practice)

# Thanks
- [Best Practice · itamae-kitchen/itamae Wiki](https://github.com/itamae-kitchen/itamae/wiki/Best-Practice)
- [Chef脱落者が、Itamaeで快適インフラ生活する話](http://qiita.com/zaru/items/8ae6182e544aac6f6d79)
- [Itamaeチートシート](http://qiita.com/fukuiretu/items/170aa956731f2ffb5715)

# LICENSE
- [MIT License](/LICENSE)
