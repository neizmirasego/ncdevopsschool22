FROM jenkins/jenkins:latest

ENV CASC_JENKINS_CONFIG /jenkins_configs

USER root
# Install Docker from official repo
RUN apt-get update -qq && \
    apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update -qq && \
    apt-get install -qqy docker-ce && \
    usermod -aG docker jenkins && \
    chown -R jenkins:jenkins $JENKINS_HOME/
RUN aptitude -y install docker-compose
RUN ln -s /usr/local/bin/docker-compose /compose/docker-compose
    
USER jenkins
VOLUME /jenkins_configs
VOLUME /var/jenkins_home

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

