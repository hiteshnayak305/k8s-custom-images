# versions
export GITEA_TAG="1.21.7-rootless"
export JENKINS_TAG="2.440.1-alpine"
export INBOUND_AGENT_TAG="3206.vb_15dcf73f6a_9-7-alpine"
export KANIKO_TAG="debug"
export K8S_TAG="1.29.2"
export ECLIPSE_TEMURIN_TAG="21-jdk-alpine"
export NODE_TAG="20-alpine"
export SSC_TAG="5"
export SONARQUBE_TAG="10.4.1-community"

# build images
docker build --build-arg TAG=$GITEA_TAG -t hiteshnayak305/gitea:$GITEA_TAG -f gitea.Dockerfile .
docker build --build-arg TAG=$JENKINS_TAG -t hiteshnayak305/jenkins:$JENKINS_TAG -f jenkins.Dockerfile .
docker build --build-arg TAG=$INBOUND_AGENT_TAG -t hiteshnayak305/inbound-agent:$INBOUND_AGENT_TAG -f jnlp.Dockerfile .
docker build --build-arg TAG=$KANIKO_TAG -t hiteshnayak305/kaniko:$KANIKO_TAG -f kaniko.Dockerfile .
docker build --build-arg TAG=$K8S_TAG -t hiteshnayak305/k8s:$K8S_TAG -f k8s.Dockerfile .
docker build --build-arg TAG=$ECLIPSE_TEMURIN_TAG -t hiteshnayak305/eclipse-temurin:$ECLIPSE_TEMURIN_TAG -f jdk.Dockerfile .
docker build --build-arg TAG=$NODE_TAG -t hiteshnayak305/node:$NODE_TAG -f node.Dockerfile .
docker build --build-arg TAG=$SSC_TAG -t hiteshnayak305/sonar-scanner-cli:$SSC_TAG -f ssc.Dockerfile .
docker build --build-arg TAG=$SONARQUBE_TAG -t hiteshnayak305/sonarqube:$SONARQUBE_TAG -f sonarqube.Dockerfile .