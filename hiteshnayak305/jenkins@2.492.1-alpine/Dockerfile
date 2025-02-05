ARG VERSION=latest
FROM jenkins/jenkins:$VERSION

# Information
LABEL org.opencontainers.image.authors="hiteshnayak305@gmail.com"
LABEL version="1.0.0"
LABEL description="This is a customized Jenkins Image to be deployed in local kubernetes lab."

# Install custom Root CA Certificate
USER root
COPY common/custom.crt /usr/local/share/ca-certificates/
RUN apk --no-cache add ca-certificates && \
    update-ca-certificates && \
    ${JAVA_HOME}/bin/keytool -import -cacerts -noprompt \
    -alias custom \
    -storepass changeit \
    -file /usr/local/share/ca-certificates/custom.crt
USER jenkins

# Customization
ENV COLLECTING_METRICS_PERIOD_IN_SECONDS=10

RUN jenkins-plugin-cli --war /usr/share/jenkins/jenkins.war --latest true --plugins \
    json-path-api mailer \
    kubernetes workflow-aggregator git configuration-as-code \
    gitea blueocean job-dsl purge-job-history jobConfigHistory view-job-filters dependency-check-jenkins-plugin \
    junit coverage htmlpublisher \
    material-theme \
    prometheus cloudbees-disk-usage-simple \
    sonar
