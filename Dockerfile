FROM consul:latest
VOLUME /backup
COPY . .
ARG CONSUL_HTTP_TOKEN
ARG KV_PATH
ARG CONSUL_HTTP_ADDR
RUN apk update && apk upgrade && apk add bash
RUN chmod +x setup.sh auto-backup.sh
CMD ["./setup.sh"]