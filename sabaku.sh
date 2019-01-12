#!/bin/bash -xe

# It is necessary to execute a command which is 'export $(cat .env | grep -v ^# | xargs); ./sabaku.sh' to use environment variables
sudo itamae ssh -h $HOST -i $SSH_KEY -u $PROVISIONED_USERNAME $RECIPE_ROLE -l debug

exit 0
