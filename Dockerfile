FROM ubuntu:trusty
MAINTAINER steven.phung@autodesk.com

RUN apt-get -y update

# java 8
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get -y update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN apt-get -y install oracle-java8-installer
RUN apt-get -y install oracle-java8-set-default
RUN apt-get -y install oracle-java8-unlimited-jce-policy

# sbt
RUN echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-get install apt-transport-https
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
RUN apt-get -y update
RUN sudo apt-get -y install sbt
RUN sbt update

# awscli
RUN apt-get install -y python-pip
RUN pip install awscli

# zip
RUN apt-get install -y zip unzip

# curl
RUN apt-get install -y curl
