FROM docker.io/nginxinc/nginx-unprivileged:1.22-alpine

COPY ./server.conf /default.conf

WORKDIR /app
COPY index.html .