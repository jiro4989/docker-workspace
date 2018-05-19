FROM jenkinsci/jenkins:2.11
 
# install via apt
USER root
 
# install jenkins plugins
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
 
# drop back to the regular jenkins user - good practice
USER jenkins
