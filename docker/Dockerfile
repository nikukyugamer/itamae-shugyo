FROM ubuntu:18.04
LABEL MAINTAINER="druaga"

# Avoid an interaction of tzdata
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update -y && apt-get install -y sudo vim wget git ssh expect rsync

# USER: root
RUN mkdir /root/.ssh
COPY ./docker_files/authorized_keys /root/.ssh/authorized_keys

# USER: ubuntu (Available sudo without password)
COPY ./docker_files/adduser.sh /root
RUN /root/adduser.sh ubuntu && usermod -aG sudo ubuntu && sleep 1 && mkdir /home/ubuntu/.ssh
COPY ./docker_files/authorized_keys /home/ubuntu/.ssh/authorized_keys
RUN chown ubuntu:ubuntu /home/ubuntu/.ssh && chmod 0700 /home/ubuntu/.ssh
RUN chown ubuntu:ubuntu /home/ubuntu/.ssh/authorized_keys && chmod 0600 /home/ubuntu/.ssh/authorized_keys
COPY ./docker_files/sudoers /etc/sudoers
RUN chown root:root /etc/sudoers && chmod 440 /etc/sudoers && rm /root/adduser.sh

RUN apt-get autoclean -y && apt-get autoremove -y

COPY ./docker_files/zsh_command_not_found /etc/zsh_command_not_found
RUN mkdir /run/sshd

CMD bash -c "/usr/sbin/sshd -D && /bin/bash"
