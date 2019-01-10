#!/bin/bash -xe

host='999.999.999.999'
username='centos'
ssh_key='/path/to/foobar.pem'
recipe='./aws_centos/initialize.rb'

sudo itamae ssh -h "$host" -i "$ssh_key" -u "$username" "$recipe" -l debug

exit 0
