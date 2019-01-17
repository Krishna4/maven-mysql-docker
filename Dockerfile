FROM maven:3.3.9

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get  update
RUN apt-get install -y software-properties-common
RUN add-apt-repository 'deb http://archive.ubuntu.com/ubuntu trusty universe' -y
RUN export DEBIAN_FRONTEND=noninteractive
RUN echo 'mysql-server mysql-server/root_password password root' |  debconf-set-selections
RUN echo 'mysql-server mysql-server/root_password_again password root' |  debconf-set-selections

RUN echo 'mysql-apt-config mysql-apt-config/repo-codename select trusty' |  debconf-set-selections
RUN echo 'mysql-apt-config mysql-apt-config/repo-distro select ubuntu' |  debconf-set-selections
RUN echo  'mysql-apt-config mysql-apt-config/repo-url string http://repo.mysql.com/apt/' |  debconf-set-selections
RUN echo  'mysql-apt-config mysql-apt-config/select-preview select ' |  debconf-set-selections
RUN echo  'mysql-apt-config mysql-apt-config/select-product select Ok' |  debconf-set-selections
RUN echo  'mysql-apt-config mysql-apt-config/select-server select mysql-5.6' |  debconf-set-selections
RUN echo 'mysql-apt-config mysql-apt-config/select-tools select ' |  debconf-set-selections
RUN echo 'mysql-apt-config mysql-apt-config/unsupported-platform select abort' |  debconf-set-selections
RUN wget https://dev.mysql.com/get/mysql-apt-config_0.8.10-1_all.deb
RUN dpkg -i mysql-apt-config_0.8.10-1_all.deb
RUN apt-get  update
RUN apt-get -y autoclean
RUN apt-get -y upgrade
RUN apt-get  install -y --force-yes ssh 
RUN apt-get install -y --force-yes mysql-server
RUN apt-get install -y --force-yes mysql-client  
RUN service mysql restart
RUN mysql -u root -proot -e 'delete from mysql.user where user="root" and host="localhost"'
RUN mysql -u root -proot -e 'GRANT ALL PRIVILEGES ON `*`.* TO `root`@`%` identified by "root"'
RUN mysql -u root -proot -e 'Show DATABASEs;'
# ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
RUN mkdir /var/run/mysqld
RUN chmod 777 /var/run/mysqld

EXPOSE 3306
