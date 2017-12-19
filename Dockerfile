FROM ruby:2.4 AS build-env

ADD . /work
WORKDIR /work
RUN make pdumpfs

FROM ruby:2.4
COPY --from=build-env /work/pdumpfs /usr/local/bin/pdumpfs

ENTRYPOINT ["/usr/local/bin/pdumpfs"]
