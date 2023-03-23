FROM node:slim

ENV RUNNER="runner"

ENV PRETTIER_VERSION="2.8.6"

RUN \
  npm install --global prettier@${PRETTIER_VERSION} \
  && ( getent passwd "${RUNNER}" || adduser --disabled-password "${RUNNER}" )


ENTRYPOINT ["prettier"]
USER "${RUNNER}"
HEALTHCHECK NONE
