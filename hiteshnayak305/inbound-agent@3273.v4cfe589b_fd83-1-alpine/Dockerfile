ARG VERSION=latest
FROM jenkins/inbound-agent:$VERSION

# Information
LABEL org.opencontainers.image.authors="hiteshnayak305@gmail.com"
LABEL version="1.0.0"
LABEL description="This is a customized Jenkins Inbound Agent Image to be deployed in local kubernetes lab."

# Install custom Root CA Certificate
USER root
COPY common/custom.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates && \
    ${JAVA_HOME}/bin/keytool -import -cacerts -noprompt\
        -alias custom \
        -storepass changeit \
        -file /usr/local/share/ca-certificates/custom.crt
USER jenkins
