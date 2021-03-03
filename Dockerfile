FROM debian:buster

RUN		apt-get update					-y &&\
		apt-get upgrade					-y &&\
		apt-get install nginx			-y &&\
		apt-get install php7.3-fpm		-y &&\
		apt-get install mariadb-server	-y &&\
		apt-get install php7.3-mysql	-y &&\
		apt-get install php-mbstring	-y &&\
		apt-get install wget			-y
	

COPY	srcs/index.html					/var/www/html/
COPY	srcs/info.php					/var/www/html/
COPY	srcs/default					/etc/nginx/sites-available/default


RUN 	wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz	&&\
		tar -zxf phpMyAdmin-5.0.4-english.tar.gz											&&\
		mv phpMyAdmin-5.0.4-english var/www/html/phpmyadmin									&&\
		rm phpMyAdmin-5.0.4-english.tar.gz													&&\
		mkdir -m 777 var/www/html/phpmyadmin/tmp

COPY	srcs/config.inc.php				/var/www/html/phpmyadmin/
COPY	srcs/guestuser.sql				/var/www/html/phpmyadmin/tmp/

EXPOSE	80

CMD 	service nginx start											&&\
		service mysql start											&&\
		mysql -u root < /var/www/html/phpmyadmin/tmp/guestuser.sql	&&\
		service php7.3-fpm start									&&\
		bash