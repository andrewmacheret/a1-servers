#!/bin/bash -e

username="andrewmacheret"

echo -n 'Password: '
read -s password
echo

travis encrypt DOCKER_USERNAME=andrewmacheret
travis encrypt DOCKER_PASSWORD="$( echo -n "$password" )"
