FROM adminer:1ab45c10c181

WORKDIR /var/tmp
RUN apk update && apk add openssh && apk add curl
ARG SSH_KEY
ARG SSH_TUNNEL

ENV SSH_KEY ${SSH_KEY:"~/.ssh/id_rsa"}
ENV SSH_TUNNEL ${SSH_TUNNEL}
# Tunnel "localhost:5432:esso-db-staging.cztongozv6g0.eu-west-1.rds.amazonaws.com:5432  ec2-user@JUM"
COPY ${SSH_KEY} ./key
COPY ${SSH_KEY}.pub ./key.pub
# RUN MY_IP=$(curl ipinfo.io/ip)/32
RUN ssh -i ./key -N -L ${SSH_TUNNEL}
