#!/bin/bash

exec /portainer/portainer &
PORTAINER_PID=$!

sleep 10

curl -X POST "http://localhost:9000/api/users/admin/init" -H "Content-Type: application/json" --data "{\"Username\":\"$PORTAINER_NAME\",\"Password\":\"$PORTAINER_PASS\"}"

echo "Portainer is ready!"

wait $PORTAINER_PID