#!/bin/bash -xe

# It is necessary to execute a command which is 'export $(cat .env | grep -v ^# | xargs); ./sabaku.sh' to use environment variables
itamae ssh -h $HOST -i $LOGIN_SSH_KEY -p $PORT_NUMBER -u $LOGIN_USERNAME $COOKBOOK -l debug

echo "$ ssh $LOGIN_USERNAME@$HOST -i /path/to/PRIVATE_KEY.pem"

exit 0
