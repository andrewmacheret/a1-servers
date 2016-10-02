#!/bin/bash -e

awk '$1 == "build:" {print $2}' docker-compose.yml | sed 's|/$||' | xargs -t -I{} git clone git@github.com:andrewmacheret/{}.git
