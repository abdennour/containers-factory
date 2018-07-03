# Build it as image

```sh
docker build -t docker-factory-aws-cli:latest .
```

**custom build**

```sh

export AWS_VERSION=1.15.49
docker build \
       --build-arg AWS_VERSION=$AWS_VERSION \
       -t docker-factory-aws-cli:$AWS_VERSION .
```

# Use it as container

```sh
sudo cp aws.sh /usr/local/bin/aws
chmod +x /usr/local/bin/aws

# aws anyservice anycmd
```
