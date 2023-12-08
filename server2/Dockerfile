FROM docker.io/nginxinc/nginx-unprivileged:1.22-alpine

COPY ./server.conf /etc/nginx/conf.d/default.conf

WORKDIR /app
COPY index.html .