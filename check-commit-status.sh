#!/bin/bash -e

ls -d */ | xargs -I{} sh -c 'cd {}; echo; echo {}; echo; git status'

