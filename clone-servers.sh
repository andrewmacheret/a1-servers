#!/usr/bin/env bash
set -e

grep build docker-compose.yml  | grep -v '#' | awk '{print $2}' | sed 's:/::' | xargs -I{} git clone https://github.com/andrewmacheret/{}.git
