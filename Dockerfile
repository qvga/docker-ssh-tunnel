FROM alpine:latest
RUN apk update && apk add openssh-client
RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64 \
        && chmod +x /usr/local/bin/dumb-init
ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
CMD ssh -NT -o PasswordAuthentication=no -o ServerAliveInterval=60 -o ServerAliveCountMax=10 -o GatewayPorts=true -o ExitOnForwardFailure=yes -o StrictHostKeyChecking=no -L $L -i /sshkey $R
