FROM ubuntu:18.04 as ansible-controller

RUN apt-get update

RUN apt-get install -y software-properties-common
RUN apt-add-repository --yes --update ppa:ansible/ansible

RUN apt-get install -y ansible \
    curl \
    iputils-ping \
    jq \
    nano \
    python-apt \
    python-pip

RUN pip install pywinrm

ADD id_rsa /root/.ssh/
RUN chmod 400 /root/.ssh/id_rsa

ADD .ansible.cfg /root

ENTRYPOINT [ "/bin/bash" ]#

FROM sickp/centos-sshd as ansible-host
COPY id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 400 /root/.ssh/authorized_keys

RUN sed -i 's/#LogLevel INFO/LogLevel VERBOSE/' /etc/ssh/sshd_config
