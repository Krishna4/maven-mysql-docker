FROM maven:3.2-jdk-8

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get upgrade -y
RUN apt-get update
RUN apt-get -q -y install mysql-server
RUN apt-get -q -y install npm
RUN apt-get -q -y install grunt
RUN apt-get -q -y install python-pip
RUN pip install --upgrade awscli
RUN pip install --upgrade awsebcli

# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
RUN mkdir /var/run/mysqld 
RUN chmod 777 /var/run/mysqld

EXPOSE 3306

