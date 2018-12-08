# Install it


```sh
sudo curl -o /usr/local/bin/aws https://cdn.jsdelivr.net/gh/abdennour/containers-factory/aws-cli/aws.sh && sudo chmod +x /usr/local/bin/aws
```

# Use it



1.
```sh
export AWS_VERSION=1.15.50
aws s3 ls
```
===> it will create local docker image `docker-factory-aws-cli:1.15.50` and run "aws s3 ls"

2.
```sh
export AWS_VERSION=1.15.50
aws s3 ls
```
Since the docker image  `docker-factory-aws-cli:1.15.50` was already created with the previous example, it will run "aws s3 ls" directly.
