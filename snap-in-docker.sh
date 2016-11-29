#!/bin/sh
#
# Build a snap using a docker container.
#
# Arguments:
#   repo: The URL of the repository to build.

set -ev

repo="$1"

docker run -v "$(pwd)":/cwd ubuntu:xenial sh -c "apt update && apt install git locales python3 python3-docopt snapcraft -y && locale-gen en_US.UTF-8 && export LC_ALL=en_US.UTF-8 && cd /cwd && python3 -m external_snaps_tests $repo"
