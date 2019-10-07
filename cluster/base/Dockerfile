FROM openjdk:8

RUN apt-get update
RUN apt-get install -y vim curl openssh-server

# add hadoop user
RUN useradd -m -s /bin/bash hadoop

# set pubkey authentication
RUN echo "PubkeyAuthentication yes" >> /etc/ssh/ssh_config

RUN mkdir -p /home/hadoop/.ssh
RUN echo "PubkeyAcceptedKeyTypes +ssh-dss" >> /home/hadoop/.ssh/config
RUN echo "PasswordAuthentication no" >> /home/hadoop/.ssh/config

# copy keys
ADD config/id_rsa.pub /home/hadoop/.ssh/id_rsa.pub
ADD config/id_rsa /home/hadoop/.ssh/id_rsa
RUN cat /home/hadoop/.ssh/id_rsa.pub >> /home/hadoop/.ssh/authorized_keys
RUN chown hadoop:hadoop -R /home/hadoop/.ssh
RUN chmod 600 /home/hadoop/.ssh/id_rsa

USER hadoop