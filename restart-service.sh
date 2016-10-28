#!/bin/bash -e

PATH="$PATH":/opt/bin

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

SERVICE_NAMES=$@

docker-compose pull ${SERVICE_NAMES}

docker-compose up -d --force-recreate ${SERVICE_NAMES}

docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null || true

