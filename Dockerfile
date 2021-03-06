FROM debian:buster-20210208

RUN		apt-get update					-y													\
	&&	apt-get upgrade					-y													\
	&&	apt-get install					-y													\
		nginx																				\
		php7.3-fpm																			\
		mariadb-server																		\
		php7.3-mysql																		\
		php-mbstring																		\
		wget																				\
	&&	rm -rf /var/lib/apt/lists/*


ENV 	AUTOINDEX=on
COPY	srcs/index.html								/var/www/html/
COPY	srcs/info.php								/var/www/html/
COPY	srcs/autoindexon							/etc/nginx/sites-available/default
COPY	srcs/autoindexon							/etc/nginx/sites-available/
COPY	srcs/autoindexoff							/etc/nginx/sites-available/
COPY	srcs/tai.sh									./
COPY	srcs/if_you_can_see_this_autoindex_is_ON	/var/www/html/autoindex-check/


RUN 	wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz	\
	&&	tar -zxf phpMyAdmin-5.0.4-english.tar.gz											\
	&&	mv phpMyAdmin-5.0.4-english var/www/html/phpmyadmin									\
	&&	rm phpMyAdmin-5.0.4-english.tar.gz													\
	&&	mkdir -m 777 var/www/html/phpmyadmin/tmp
COPY	srcs/config.inc.php							/var/www/html/phpmyadmin/


RUN		wget https://wordpress.org/wordpress-5.6.2.tar.gz									\
	&&	tar -zxf wordpress-5.6.2.tar.gz														\
	&&	rm wordpress-5.6.2.tar.gz															\
	&&	mv wordpress var/www/html/
COPY	srcs/wp-config.php							/var/www/html/wordpress/


COPY	srcs/adminphp.sql							/var/www/html/phpmyadmin/tmp/
COPY	srcs/wordpress_db.sql						/var/www/html/phpmyadmin/tmp/


RUN		openssl req -new -newkey rsa:4096 -days 365 -nodes -x509							\
		-subj "/C=SP/ST=Caceres/L=Plasencia/O=42/CN=jpizarro"								\
		-keyout /etc/ssl/private/jpizarro.key -out /etc/ssl/certs/jpizarro.crt


CMD 	service nginx start																	\
	&&	service mysql start																	\
	&&	mysql -u root < /var/www/html/phpmyadmin/tmp/adminphp.sql							\
	&&	mysql -u root wordpress_db < /var/www/html/phpmyadmin/tmp/wordpress_db.sql			\
	&&	service php7.3-fpm start															\
	&&	bash
