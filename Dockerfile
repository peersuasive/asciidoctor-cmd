FROM asciidoctor/docker-asciidoctor

ARG UID
ARG GID

# create webadm and add them to sudoers
RUN addgroup -g ${GID} usergroup && adduser -s /bin/bash -u ${UID} -D -G usergroup user \
      && echo "user:user"|chpasswd

USER user
ENTRYPOINT ["/usr/bin/asciidoctor", "-r", "asciidoctor-diagram"]
