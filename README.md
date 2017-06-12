# What's this?
[Itamae](http://itamae.kitchen/) codes for provisioning to clean `Ubuntu 16.04 LTS Xenial Xerus`

# Overviewing
- Install `Ubuntu 16.04 LTS Xenial Xerus` to any machine
- exec `Itamae` to its machine as below

```bash
$ sudo itamae ssh -h "HOSTNAME" -u "USERNAME" "RECIPE_NAME" -l debug
```

# How to use
- rename `sabaku.sh.sample` to `sabaku.sh`
    - in `sabaku.sh`, you muse define three values
        - host(target host)
        - username(target host's login user)
        - recipe(recipe you wanna use)
- assemble each recipe to above `recipe(recipe you wanna use)`
    - for exapmle below

```
include_recipe "./roles_sets/after_clean_install.rb"
include_recipe "../cookbooks/ssh-key/ssh-key.rb"
include_recipe "../cookbooks/change_ssh_port.rb"
include_recipe "../cookbooks/mount_storage.rb"
```

- exec `sabaku.sh` to provisioning by `Itamae`! `Sa-Ba-Ku`!

# Notes
- similar to my previous script [`itamae-for-rbenv`](https://github.com/corselia/itamae-for-rbenv)... this is its brush up version!
- IN MY CASE, some operations must by my hand avoid to be trouble
    - `mysql-server` because of dialogue showed
    - `reboot`
- it takes about 30 minutes to complete in this recipes

# Tips for `Sa-Ba-Ku`
- the word `sabaku` which contains in `sabaku.sh` is Japanese verb word `捌く(Sa-Ba-Ku)`, which means `to deal with foodstuff well`
    - [example image](http://livedoor.blogimg.jp/maamee123/imgs/b/f/bf9923eb.jpg)

# Thanks
- [Best Practice · itamae-kitchen/itamae Wiki](https://github.com/itamae-kitchen/itamae/wiki/Best-Practice)
- [Chef脱落者が、Itamaeで快適インフラ生活する話](http://qiita.com/zaru/items/8ae6182e544aac6f6d79)
- [Itamaeチートシート](http://qiita.com/fukuiretu/items/170aa956731f2ffb5715)

# LICENSE
- [MIT License](/LICENSE)
