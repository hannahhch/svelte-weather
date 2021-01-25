FROM node:14-buster

MAINTAINER CalCoastTech <svelte-fishing@calcoasttech.com>

COPY . .
RUN \
  npm install && \
  npm run build

EXPOSE 5000

CMD ["npm","run","serve"]