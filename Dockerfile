FROM alpine:3.12

ARG BUILD_DATE
ARG VCS_REF

LABEL maintainer="Barry Tucker <btucker@mintel.com>" \
      org.opencontainers.image.title="k8s-postgresclient" \
      org.opencontainers.image.description="Minimal image with postgres-client installed." \
      org.opencontainers.url="https://github.com/mintel/k8s-postgresclient" \
      org.opencontainers.source="https://github.com/mintel/k8s-postgresclient.git" \
      org.opencontainers.image.version="0.1.0" \
      org.opencontainers.image.vendor="Mintel Group Ltd." \
      org.opencontainers.image.licences="MIT" \
      org.opencontainers.authors="Barry Tucker <btucker@mintel.com>" \
      org.opencontainers.image.created="$BUILD_DATE" \
      org.opencontainers.image.revision="$VCS_REF"

COPY --from=gcr.io/google_containers/pause-amd64:3.2 /pause /

RUN apk add --no-cache postgresql-client
RUN adduser -D -s /bin/sh -u 1000 mintel --home /home/mintel

USER 1000

ENTRYPOINT ["psql"]
CMD ["/pause"]
