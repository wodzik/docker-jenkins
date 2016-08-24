FROM jenkins

USER root

RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

RUN apt-get update && apt-get install -y --no-install-recommends python python-yaml python-setuptools pkg-config apt-transport-https ca-certificates bash-completion lxc iptables dos2unix groovy2

RUN easy_install python-dotenv

RUN cd /root && git clone https://github.com/droptica/docker-drupal.git \
    && cd docker-drupal && python setup.py install && cd .. && rm -Rf docker-drupal

RUN echo 'deb https://apt.dockerproject.org/repo debian-jessie main' > /etc/apt/sources.list.d/docker.list

RUN apt-get update && apt-get install -y docker-engine 

RUN usermod -aG docker jenkins

RUN curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

RUN chmod +x /usr/local/bin/docker-compose

ADD ./start.sh /start.sh

RUN chmod 777 /start.sh

RUN touch /var/run/docker.sock

VOLUME /var/lib/docker

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80 443

ENTRYPOINT ["/bin/bash", "-c", "/start.sh"]
