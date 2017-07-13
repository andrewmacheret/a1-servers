#!/usr/bin/env bash
set -e

# prereqs:
#  yum install jq
#  yum install python-yaml

yaml_to_json() {
  python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout)'
}

BUILD_CONTEXTS="$(
  cat docker-compose.yml |
    yaml_to_json |
    jq -r '.services[] | select(.build != null) | (.build, .build.context? | select(type == "string")) + "\t" + .image' |
    sort
)"

echo "(Re)cloning build contexts:"
echo "$BUILD_CONTEXTS" | column -t

IFS=$'\n'
for BUILD_CONTEXT in $BUILD_CONTEXTS; do
  BUILD="$( echo "$BUILD_CONTEXT" | cut -f1 | xargs -n1 basename )"
  IMAGE="$( echo "$BUILD_CONTEXT" | cut -f2 )"
  echo
  echo "BUILD=$BUILD"
  echo "IMAGE=$IMAGE"
  echo "..."

  echo "rm -f '$BUILD' ..."
  rm -rf "$BUILD"
  echo "git clone 'git@github.com:${IMAGE}.git' '$BUILD'"
  git clone "git@github.com:${IMAGE}.git" "$BUILD"
done

