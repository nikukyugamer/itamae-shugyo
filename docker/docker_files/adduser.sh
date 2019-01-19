#!/bin/bash -xe

if [ $# -ne 1 ]; then
  echo "ERROR: ONE ARG IS NECESSARY" 1>&2
  exit 1
fi

USER_NAME=$1
PASSWORD=YOUR_PASSWORD

echo ${USER_NAME}

expect -c "
spawn adduser ${USER_NAME}
expect \"Enter new UNIX password:\"
send -- \"${PASSWORD}\n\"
expect \"Retype new UNIX password:\"
send -- \"${PASSWORD}\n\"
expect \"Full Name\"
send -- \"\n\"
expect \"Room Number\"
send -- \"\n\"
expect \"Work Phone\"
send -- \"\n\"
expect \"Home Phone\"
send -- \"\n\"
expect \"Other\"
send -- \"\n\"
expect \"Is the information correct?\"
send -- \"Y\n\"
interact
"

exit 0
