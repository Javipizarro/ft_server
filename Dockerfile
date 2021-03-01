FROM debian:buster

RUN	apt-get update					-y &&\
	apt-get upgrade					-y &&\
	apt-get install nginx			-y &&\
	apt-get install php7.3-fpm		-y &&\
	apt-get	install mariadb-server	-y &&\
	apt-get install php7.3-mysql	-y

#toni
#RUN 	apt-get update && apt-get -y install nginx php7.3-fpm php7.3-mysql mariadb-server openssl\
#		&& rm -rf /var/lib/apt/lists/*
#COPY 	srcs/nginx.conf /etc/nginx/sites-available/
#COPY	srcs/wordpress  /var/www/html/wordpress
#COPY	srcs/phpMyAdmin /var/www/html/phpMyAdmin
#COPY 	srcs/newdb.sql ./
#COPY 	srcs/localhost.sql ./
#COPY	srcs/index.html /var/www/html/

RUN	apt-get install vim -y

#COPY . /usr/share/nginx/html
COPY	srcs/index.html		/var/www/html/					&&\
		srcs/defaul			/etc/nginx/sites-available/		&&\
		srcs/info.php		/var/www/html/

#COPY srcs/nginx-init.sh ./root/

EXPOSE 80

#CMD [“nginx”,”-g”,”daemon off;”]
#CMD [ "echo", "apt-get upgrade running" ]
#CMD bash root/nginx-init.sh
CMD 	service nginx start && \
		service php7.3-fpm start && \
		bash