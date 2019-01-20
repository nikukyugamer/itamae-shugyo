#!/bin/bash -xe

docker-compose up --build -d
cd .. && export $(cat .env | grep -v ^# | xargs); ./sabaku.sh
docker exec -it castlevania /bin/bash

exit 0
