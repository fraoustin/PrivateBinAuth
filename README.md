# PrivatebinAuth

add authorization for backend of private bin

## build and use

clone repository

> git clone https://github.com/fraoustin/PrivateBinAuth.git


build your image

> docker build -t privatebinauth .

run your image

> docker run -d --restart="always" -p 8080:8080 --name privatebinauth privatebinauth

add login / password

> docker exec -it  --user=root privatebinauth sh
> > htpasswd -c /etc/nginx/htpasswd <user>

more options on https://hub.docker.com/r/privatebin/nginx-fpm-alpine

for usage you can use http://127.0.0.1:8080/login