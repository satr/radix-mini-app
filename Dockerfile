FROM docker.io/node:alpine

WORKDIR /app

COPY ./server .

RUN echo "***************** root Dockerfile ******************"

RUN --mount=type=secret,id=RADIX_GIT_COMMIT_HASH,dst=/abc/my-secrets/secret-1.txt export RADIX_GIT_COMMIT_HASH=$(cat /abc/my-secrets/secret-1.txt) && echo $RADIX_GIT_COMMIT_HASH
RUN --mount=type=secret,id=RADIX_GIT_TAGS,dst=/abc/my-secrets/secret-1.txt export RADIX_GIT_TAGS=$(cat /abc/my-secrets/secret-1.txt) && echo $RADIX_GIT_TAGS
RUN --mount=type=secret,id=BRANCH,dst=/abc/my-secrets/secret-1.txt export BRANCH=$(cat /abc/my-secrets/secret-1.txt) && echo $BRANCH
RUN --mount=type=secret,id=TARGET_ENVIRONMENTS,dst=/abc/my-secrets/secret-1.txt export TARGET_ENVIRONMENTS=$(cat /abc/my-secrets/secret-1.txt) && echo $TARGET_ENVIRONMENTS

RUN echo "***************** root Dockerfile ******************"


USER 1001
EXPOSE 8080
CMD ["node", "server.js"]
