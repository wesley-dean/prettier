FROM node:23.11.0-slim

ENV RUNNER="runner"

WORKDIR /
COPY package.json .

RUN \
  npm install \
  && ( getent passwd "${RUNNER}" || adduser --disabled-password "${RUNNER}" )


ENTRYPOINT ["/node_modules/.bin/prettier"]
USER "${RUNNER}"
HEALTHCHECK NONE
