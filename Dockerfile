FROM mysql:5.7
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_ALLOW_EMPTY_PASSWORD=no

RUN apt-get update
RUN apt-get -y install software-properties-common
RUN apt-get update
#RUN java -version
RUN apt-get -y upgrade
RUN apt-get purge -y openjdk*
#RUN apt -y install default-jdk
USER root
RUN mkdir -p /usr/share/man/man1 && \
    apt-get update -y && \
    apt-get install -y openjdk-8-jdk
#RUN apt-get -y  install openjdk-8-jdk openjdk-8-jdk-headless 
#RUN add-apt-repository -y ppa:webupd8team/java
#RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
#RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
#RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN apt update
RUN apt-get -y install maven ssh git
RUN mvn -version
