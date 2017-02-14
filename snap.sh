#!/bin/sh
#
# Build a snap using a docker container.
#
# Arguments:
#   repo:       The URL of the repository to build.
#   repo-brach: (optional) The branch of the repository to build. If it is not
#               passed, the default branch will be built.
#   PPA:        (optional) A PPA with build requirements for the snap.

repo="$1"

if [ ! -z "$2" ]; then
    repo_branch="--repo-branch $2"
fi

if [ ! -z "$3" ]; then
    ppa="$3"
    apt install software-properties-common -y
    add-apt-repository -y $ppa
fi

apt update
apt install bzr git python3 python3-docopt snapcraft -y

python3 -m external_snaps_tests $repo $repo_branch
