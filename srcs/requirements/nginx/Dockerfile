FROM debian:buster

LABEL maintainer="NGINX Docker Maintainers <docker-maint@nginx.com>"

RUN apt-get update -y \
&&  apt-get install -y nginx openssl

COPY /conf/conf /etc/nginx/conf

EXPOSE 443

#daemon off = se lance en priorite
CMD ["nginx", "-g", "daemon off;"]