FROM docker.io/nginxinc/nginx-unprivileged:1.24.0-alpine-slim

RUN echo "***************** root Dockerfile ******************"

RUN --mount=type=secret,id=RADIX_GIT_COMMIT_HASH,dst=/abc/my-secrets/secret-1.txt export RADIX_GIT_COMMIT_HASH=$(cat /abc/my-secrets/secret-1.txt) && echo $RADIX_GIT_COMMIT_HASH
RUN --mount=type=secret,id=RADIX_GIT_TAGS,dst=/abc/my-secrets/secret-1.txt export RADIX_GIT_TAGS=$(cat /abc/my-secrets/secret-1.txt) && echo $RADIX_GIT_TAGS
RUN --mount=type=secret,id=BRANCH,dst=/abc/my-secrets/secret-1.txt export BRANCH=$(cat /abc/my-secrets/secret-1.txt) && echo $BRANCH
RUN --mount=type=secret,id=TARGET_ENVIRONMENTS,dst=/abc/my-secrets/secret-1.txt export TARGET_ENVIRONMENTS=$(cat /abc/my-secrets/secret-1.txt) && echo $TARGET_ENVIRONMENTS

RUN echo "***************** root Dockerfile ******************"

COPY ./server/server.conf /etc/nginx/conf.d/default.conf

WORKDIR /app
COPY ./server/index.html .