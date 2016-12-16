FROM java:jre-alpine

RUN apk add --no-cache curl python ruby

RUN curl -o /usr/local/bin/digdag --create-dirs -sL "https://dl.digdag.io/digdag-latest" \
  && chmod +x /usr/local/bin/digdag

ARG user=digdag
ARG group=digdag

RUN addgroup ${group} \
  && adduser -D -H -G ${group} ${user}

WORKDIR /tmp
USER ${user}

ENTRYPOINT ["/bin/ash", "/usr/local/bin/digdag"]
CMD ["server", "--help"]
