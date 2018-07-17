#!/usr/bin/env bash

# Put it in
set -o errexit
set -o nounset
set -o pipefail

# enable interruption signal handling
trap - INT TERM

SSH_KEY=$1
SSH_TUNNEL=$2
IMAGE=adminer-ssh-${USER};

# If the image does not exist locally, build it.
if [[ -z $(docker images -q $IMAGE) ]]; then
  TMP=/tmp/containers-factory;
  rm -rf $TMP;
  git clone https://github.com/abdennour/containers-factory.git $TMP;
  cd $TMP/adminer-ssh-tunnel;
  docker build \
       --build-arg SSH_KEY=$SSH_KEY SSH_TUNNEL=$SSH_TUNNEL \
       -t $IMAGE .
  cd /tmp && rm -rf $TMP;
fi

docker run --rm \
	-t $(tty &>/dev/null && echo "-i") \
	-e "AWS_PROFILE=${PROFILE}" \
	-e "AWS_DEFAULT_REGION=${REGION}" \
	-v $(pwd):/project \
  -v ~/.aws:/root/.aws \
	$IMAGE \
	"$@"
