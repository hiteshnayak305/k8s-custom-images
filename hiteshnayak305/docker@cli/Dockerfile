ARG VERSION=cli
FROM docker:$VERSION

# Information
LABEL org.opencontainers.image.authors="hiteshnayak305@gmail.com"
LABEL version="1.0.0"
LABEL description="This is a customized docker cli tool Image to be deployed in local kubernetes lab."

# Environment Variables
ENV BUILDKIT_HOST=localhost
ENV BUILDKIT_PORT=1234

# Install custom Root CA Certificate
COPY common/custom.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates

# Install entrypoint script
COPY common/docker/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
CMD [ "/bin/sh" ]
