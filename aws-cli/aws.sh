#!/usr/bin/env bash

# Put it in
set -o errexit
set -o nounset
set -o pipefail

# enable interruption signal handling
trap - INT TERM

VERSION=${AWS_VERSION:-1.15.50}
REGION=${AWS_DEFAULT_REGION:-us-east-1}
PROFILE=${AWS_PROFILE:-default}
IMAGE=docker-factory-aws-cli:$VERSION

# If the image does not exist locally, build it.
if [[ -z $(docker images -q $IMAGE) ]]; then
  git clone https://github.com/abdennour/containers-factory.git /tmp/containers-factory;
  cd /tmp/containers-factory/aws-cli;
  docker build \
       --build-arg AWS_VERSION=$VERSION \
       -t $IMAGE .

fi

docker run --rm \
	-t $(tty &>/dev/null && echo "-i") \
	-e "AWS_PROFILE=${PROFILE}" \
	-e "AWS_DEFAULT_REGION=${REGION}" \
	-v $(pwd):/project \
  -v ~/.aws:/root/.aws \
	$IMAGE \
	"$@"
