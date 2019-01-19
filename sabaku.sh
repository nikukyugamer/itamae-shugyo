#!/bin/bash -xe

# It is necessary to execute a command which is 'export $(cat .env | grep -v ^# | xargs); ./sabaku.sh' to use environment variables
itamae ssh -h $HOST -i $SSH_KEY -p $PORT_NUMBER -u $PROVISIONED_USERNAME $COOKBOOK -l debug

exit 0
