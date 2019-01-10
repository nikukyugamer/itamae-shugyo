# Required
```bash
$ gem install itamae
$ gem install dotenv
```

# What's this?
- My [Itamae](http://itamae.kitchen/) recipes

# Overviewing
- Itamae recipes for `Ubuntu`
- Not fully recipes because under developing
    - Previous version has been deprecated because it is not awesome
    - Now the recipes are not [best practice](https://github.com/itamae-kitchen/itamae/wiki/Best-Practice) but bad practice

# How to use
```bash
$ bundle install --path vendor/bundle
$ cp remote_files/2753ecc55c208095d2a150a43f2bee44.sample remote_files/2753ecc55c208095d2a150a43f2bee44
$ vim 2753ecc55c208095d2a150a43f2bee44 # Write secret key (it's some danger)
$ itamae ssh -h hostname my_recipe.rb # You need SSH key and configuration of ~/.ssh/config and SSH login user MUST be able to sudo
```

# Tips for `Sa-Ba-Ku`
- The word `sabaku` which contains in `sabaku.sh` is Japanese verb word `捌く(Sa-Ba-Ku)`, which means `to deal with foodstuff well`
    - [Example image](http://livedoor.blogimg.jp/maamee123/imgs/b/f/bf9923eb.jpg)

# Note
- I've been training as `Itamae`, that is `SHUGYO-CHU` (under training)
    - So this repository name is `Itamae Shugyo`

# Thanks
- [Best Practice · itamae-kitchen/itamae Wiki](https://github.com/itamae-kitchen/itamae/wiki/Best-Practice)
- [Chef脱落者が、Itamaeで快適インフラ生活する話](http://qiita.com/zaru/items/8ae6182e544aac6f6d79)
- [Itamaeチートシート](http://qiita.com/fukuiretu/items/170aa956731f2ffb5715)

# LICENSE
- [MIT License](/LICENSE)
