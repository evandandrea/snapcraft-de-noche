#!/bin/sh
#
# Build a snap using a docker container.
#
# Arguments:
#   repo: The URL of the repository to build.

set -ev

repo="$1"

docker run -v "$(pwd)":/cwd ubuntu:xenial sh -c "apt update && apt install bzr git python3 python3-docopt snapcraft -y && cd /cwd && python3 -m external_snaps_tests $repo"
