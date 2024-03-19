FROM jenkins/inbound-agent:3206.vb_15dcf73f6a_9-7-alpine

# Information
LABEL org.opencontainers.image.authors="hiteshnayak305@gmail.com"
LABEL version="1.0.0"
LABEL description="This is a customized Jenkins Inbound Agent Image to be deployed in local kubernetes lab."

# Install custom Root CA Certificate
USER root
COPY common/custom.crt /usr/local/share/ca-certificates/
RUN chmod 0644 /usr/local/share/ca-certificates/custom.crt && \
    update-ca-certificates && \
    ${JAVA_HOME}/bin/keytool -import -cacerts -alias custom -noprompt -storepass changeit -file /usr/local/share/ca-certificates/custom.crt
USER jenkins
