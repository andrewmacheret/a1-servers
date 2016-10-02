#!/bin/bash -e

username="andrewmacheret"

(travis encrypt "DOCKER_USERNAME=$username" | sed 's/^/      - secure: /') 2>&1 | grep -v '^detected repository '
(travis encrypt "DOCKER_PASSWORD=$( echo -n 'Password: '; read -s password; echo; echo -n "$password" )" | sed 's/^/      - secure: /') 2>&1 | grep -v '^detected repository '
