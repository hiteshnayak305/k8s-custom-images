FROM sonarqube:10.4.1-community

# Information
LABEL org.opencontainers.image.authors="hiteshnayak305@gmail.com"
LABEL version="1.0.0"
LABEL description="This is a customized SonarQube Image to be deployed in local kubernetes lab."

# Install custom Root CA Certificate
USER root
COPY common/custom.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates && \
    ${JAVA_HOME}/bin/keytool -import -cacerts -alias custom -noprompt -storepass changeit -file /usr/local/share/ca-certificates/custom.crt
USER sonarqube
