FROM debian:9-slim

ENV SSH_AUTH_SOCK="/ssh_agent" \
    ANSIBLE_VERSION="2.4.2.0"

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
            python-pip \
            openssh-client && \
    echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config && \
    echo "    UserKnownHostsFile=/dev/null" >> /etc/ssh/ssh_config && \
    pip2 install ansible==$ANSIBLE_VERSION

WORKDIR /ansible

CMD ["ansible", "--version"]
