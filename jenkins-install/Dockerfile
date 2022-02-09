FROM jenkins/jenkins:latest

#ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

ENV CASC_JENKINS_CONFIG /jenkins_configs

USER jenkins
VOLUME /jenkins_configs
VOLUME /var/jenkins_home

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

#COPY casc.yaml /var/jenkins_home/casc.yaml

