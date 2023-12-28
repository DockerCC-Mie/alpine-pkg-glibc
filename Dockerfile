FROM miraclemie/alpine:3.6
MAINTAINER Mie
ENV VERSION_GLIBC=2.21-r2
RUN apk add --update wget ca-certificates \
    && cd /tmp \
    && wget "https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${VERSION_GLIBC}/glibc-${VERSION_GLIBC}.apk" "https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${VERSION_GLIBC}/glibc-bin-${VERSION_GLIBC}.apk" \
    && apk add --allow-untrusted glibc-${VERSION_GLIBC}.apk glibc-bin-${VERSION_GLIBC}.apk \
    && echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf \
    #&& rm -rf /tmp/* /root/.cache /var/cache/apk/*
