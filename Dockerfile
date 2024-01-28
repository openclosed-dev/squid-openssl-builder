FROM ubuntu:focal-20231211

ARG SQUID_VERSION

ENV DEBIAN_FRONTEND=noninteractive
ENV SQUID_VERSION=${SQUID_VERSION}

RUN sed -i 's/^# deb-src/deb-src/g' /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y build-essential devscripts libssl-dev \
    && apt-get build-dep -y squid

RUN mkdir /build && cd /build && apt-get source squid

WORKDIR /build/squid-${SQUID_VERSION}
RUN sed -i 's/--with-gnutls/--with-gnutls --with-openssl/' debian/rules

RUN debuild -uc -us

ENTRYPOINT [ "/bin/bash", "-c", "cp /build/*.deb /dist/" ]
