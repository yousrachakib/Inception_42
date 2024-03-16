FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y nginx openssl;

COPY ./conf/default /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]