#!/bin/bash -xe

host='999.999.999.999'
username='USERNAME'
ssh_key='ssh_key.pem'
recipe='./roles/my_recipe.rb'

sudo itamae ssh -h "$host" -i "$ssh_key" -u "$username" "$recipe" -l debug

exit 0
