FROM debian:buster

RUN 	apt update -y && apt upgrade -y && apt install -y nginx openssl;

RUN 	mkdir -p etc/nginx/ssl

RUN 	openssl req -x509 -nodes -out /etc/nginx/ssl/yochakib.crt -keyout /etc/nginx/ssl/yochakib.key -subj \
		"/C=MA/ST=Béni Mellal-Khénifra/L=Khouribga/O=42/OU=42/CN=yochakib.42.fr/UID=yochakib"

COPY 	./conf/default /etc/nginx/sites-enabled/default

CMD 	["nginx", "-g", "daemon off;"]