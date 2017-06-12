# install base packages
include_recipe "../../cookbooks/apt-get_update/apt-get_update.rb"
include_recipe "../../cookbooks/apt-get_upgrade/apt-get_upgrade.rb"
include_recipe "../../cookbooks/localize_ja/localize_ja.rb"
include_recipe "../../cookbooks/build-essential/build-essential.rb"

# software-properties-common, wget, curl, zip, unzip, git, gcc, build-essential, libssl-dev, libreasline-dev, zlib1g-dev
include_recipe "../../cookbooks/common_apps/common_apps.rb"
