#!/bin/bash -e

USERNAME=andrewmacheret
REPOSITORY="$1"

[[ "$REPOSITORY" != "" ]] || {
  echo "USAGE: $( basename "$0" ) <REPOSITORY>" 1>&2
  exit 1
}

badges=(
  "[![Build Status](https://travis-ci.org/${USERNAME}/${REPOSITORY}.svg?branch=master)](https://travis-ci.org/${USERNAME}/${REPOSITORY})"
  "[![Docker Stars](https://img.shields.io/docker/stars/${USERNAME}/${REPOSITORY}.svg)](https://hub.docker.com/r/${USERNAME}/${REPOSITORY}/)"
  "[![Docker Pulls](https://img.shields.io/docker/pulls/${USERNAME}/${REPOSITORY}.svg)](https://hub.docker.com/r/${USERNAME}/${REPOSITORY}/)"
  "[![License](https://img.shields.io/badge/license-MIT-lightgray.svg)](https://github.com/${USERNAME}/${REPOSITORY}/blob/master/LICENSE.md)"
)

echo ${badges[@]}
