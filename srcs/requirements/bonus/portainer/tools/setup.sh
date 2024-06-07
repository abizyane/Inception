#!/bin/bash

cd /opt/portainer

sed -i 's/localhost/0.0.0.0/g' app/docker/views/proxy/initEndpointProxy.js

touch .env

yarn install  --legacy-peer-deps

yarn build

exec yarn webpack-dev-server --host=0.0.0.0 --port=9000


# &
# sleep 10

# # Use the Portainer API to automate sign-in process
# curl -H "Content-Type: application/json" \
#      -d '{"Username": "admin", "Password": "password"}' \
#      http://localhost:9000/api/auth