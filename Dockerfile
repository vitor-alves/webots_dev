FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -y wget

#COPY webots_2019a-rev1_amd64.deb ./webots_2019a-rev1_amd64.deb
RUN wget https://github.com/omichel/webots/releases/download/R2019a-rev1/webots_2019a-rev1_amd64.deb
COPY libpng12-0_1.2.54-1ubuntu1.1_amd64.deb ./libpng12-0_1.2.54-1ubuntu1.1_amd64.deb

RUN apt-get install -y ./libpng12-0_1.2.54-1ubuntu1.1_amd64.deb

RUN apt-get install -y ./webots_2019a-rev1_amd64.deb

RUN rm ./webots_2019a-rev1_amd64.deb
RUN rm ./libpng12-0_1.2.54-1ubuntu1.1_amd64.deb

RUN apt-get install -y libnss3-dev

RUN apt-get install -y lsb-release

RUN mkdir -p ./.config/Cyberbotics
COPY Webots-R2019a.conf ./config/Cyberbotics/Webots-R2019a.conf

#Webots WebUI
EXPOSE 1234
