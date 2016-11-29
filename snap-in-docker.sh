#!/bin/sh
#
# Build a snap using a docker container.
#
# Arguments:
#   repo:       The URL of the repository to build.
#   repo-brach: The branch of the repository to build. If it is not passed, the
#               default branch will be built.

set -ev

repo="$1"

if [ ! -z "$2" ]; then
    repo_branch="--repo-branch $2"
fi

docker run -v "$(pwd)":/cwd ubuntu:xenial sh -c "apt update && apt install git locales python3 python3-docopt snapcraft -y && locale-gen en_US.UTF-8 && export LC_ALL=en_US.UTF-8 && cd /cwd && python3 -m external_snaps_tests $repo $repo_branch"
