
FROM alpine:3.23

RUN apk --update-cache upgrade

RUN apk add nginx

COPY --chown=root:root ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY --chown=root:root ./nginx/default.conf /etc/nginx/http.d/default.conf

ENTRYPOINT ["/bin/sh", "-c", "/usr/sbin/nginx"]

