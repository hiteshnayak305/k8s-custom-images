# build images
. build.sh

# push images
docker image push hiteshnayak305/gitea:$GITEA_TAG
docker image push hiteshnayak305/jenkins:$JENKINS_TAG
docker image push hiteshnayak305/inbound-agent:$INBOUND_AGENT_TAG
docker image push hiteshnayak305/kaniko:$KANIKO_TAG
docker image push hiteshnayak305/k8s:$K8S_TAG
docker image push hiteshnayak305/eclipse-temurin:$ECLIPSE_TEMURIN_TAG
docker image push hiteshnayak305/node:$NODE_TAG
docker image push hiteshnayak305/sonar-scanner-cli:$SSC_TAG
docker image push hiteshnayak305/sonarqube:$SONARQUBE_TAG
docker image push hiteshnayak305/grafana:$GRAFANA_TAG
docker image push hiteshnayak305/prometheus:$PROMETHEUS_TAG
