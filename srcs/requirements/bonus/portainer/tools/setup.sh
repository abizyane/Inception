#!/bin/bash

HASHED_PASSWORD=$(htpasswd -nbBC 10 "" $PORTAINER_PASS | tr -d ':\n')

exec /portainer/portainer --admin-password=$HASHED_PASSWORD 