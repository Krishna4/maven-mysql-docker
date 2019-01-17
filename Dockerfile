
FROM mysql:5.7
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_ALLOW_EMPTY_PASSWORD=no

RUN apt-get update
RUN apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
RUN apt-get update
RUn apt-get -y  install openjdk-8-jdk
RUN apt-get -y install maven
RUN mvn -version
