#!/bin/bash -xe

docker-compose up --build -d
cd ~/.ghq/github.com/corselia/itamae-shugyo && export $(cat ~/.ghq/github.com/corselia/itamae-shugyo/.env | grep -v ^# | xargs); ~/.ghq/github.com/corselia/itamae-shugyo/sabaku.sh
docker exec -it castlevania /bin/bash

exit 0
