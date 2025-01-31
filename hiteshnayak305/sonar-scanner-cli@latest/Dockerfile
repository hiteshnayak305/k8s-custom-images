ARG VERSION=latest
FROM sonarsource/sonar-scanner-cli:$VERSION

# Information
LABEL org.opencontainers.image.authors="hiteshnayak305@gmail.com"
LABEL version="1.0.0"
LABEL description="This is a customized Jenkins sonar scanner cli Image to be deployed in local kubernetes lab."

USER root

# Install custom Root CA Certificate
COPY common/custom.crt /custom.crt
RUN ${JAVA_HOME}/bin/keytool -import -cacerts -noprompt\
    -alias custom \
    -storepass changeit \
    -file /custom.crt

ENV SONAR_SCANNER_OPTS="${SONAR_SCANNER_OPTS} \
    -Dsonar.scanner.keystorePath=${JAVA_HOME}/lib/security/cacerts \
    -Dsonar.scanner.keystorePassword=changeit \
    -Dsonar.scanner.skipJreProvisioning=true"

USER scanner-cli
