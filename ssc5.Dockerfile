FROM sonarsource/sonar-scanner-cli:5

# Information
LABEL org.opencontainers.image.authors="hiteshnayak305@gmail.com"
LABEL version="1.0.0"
LABEL description="This is a customized Jenkins sonar scanner cli Image to be deployed in local kubernetes lab."

# Install custom Root CA Certificate
COPY common/custom.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates && \
    ${JAVA_HOME}/bin/keytool -import -cacerts -alias custom -noprompt -storepass changeit -file /usr/local/share/ca-certificates/custom.crt
