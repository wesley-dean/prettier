FROM node:slim

ENV RUNNER="runner"

ENV PRETTIER_VERSION="2.8.6"

WORKDIR /
COPY package.json .

RUN \
  npm install \
  && ( getent passwd "${RUNNER}" || adduser --disabled-password "${RUNNER}" )


ENTRYPOINT ["/node_modules/.bin/prettier"]
USER "${RUNNER}"
HEALTHCHECK NONE
