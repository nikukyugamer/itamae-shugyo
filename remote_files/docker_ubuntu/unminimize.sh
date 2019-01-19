#!/bin/bash -xe

expect -c "
spawn sudo unminimize
expect \"Would you like to continue?\"
send -- \"y\n\"
interact
"

exit 0