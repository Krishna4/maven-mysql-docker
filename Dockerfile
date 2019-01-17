FROM mysql:5.7
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_ALLOW_EMPTY_PASSWORD=no


FROM maven:3.3.9
RUN apt-get update
RUN apt-get -y install software-properties-common
RUN apt-get update
RUN apt-get -y install ssh git
