FROM centos:centos7

ADD ./sshd_config /etc/ssh/sshd_config
ADD /.pylintrc /etc/.pylintrc
ADD ./setup_script.sh ./setup.sh
RUN ./setup.sh
