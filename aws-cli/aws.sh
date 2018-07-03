#!/usr/bin/env bash

# Put it in
set -o errexit
set -o nounset
set -o pipefail

# enable interruption signal handling
trap - INT TERM

REGION=${AWS_DEFAULT_REGION:-us-east-1}
PROFILE=${AWS_PROFILE:-default}

docker run --rm \
	-t $(tty &>/dev/null && echo "-i") \
	-e "AWS_PROFILE=${PROFILE}" \
	-e "AWS_DEFAULT_REGION=${REGION}" \
	-v $(pwd):/project \
  -v ~/.aws:/root/.aws \
	docker-factory-aws-cli:1.15.50 \
	"$@"
