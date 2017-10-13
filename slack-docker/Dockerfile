FROM mhart/alpine-node:8

COPY . /app
WORKDIR /app

RUN \
  apk add --update vim && \
  yarn install && \
  rm -rf /var/cache/apk/* /var/tmp/*

CMD ["node", "app.js"]
