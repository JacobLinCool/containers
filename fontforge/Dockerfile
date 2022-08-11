FROM alpine:latest as fontforge

ENV FONTFORGE_LANGUAGE=ff

WORKDIR /data
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk add --no-cache fontforge

ENTRYPOINT [ "fontforge" ]

FROM fontforge as fontforge-convert

COPY convert.sh /usr/bin/convert.sh
RUN chmod +x /usr/bin/convert.sh

ENTRYPOINT [ "convert.sh" ]
