
docker build -t hiteshnayak305/gitea:1.21.7-rootless -f gitea.Dockerfile .
docker build -t hiteshnayak305/jenkins:2.440.1-jdk17 -f jenkins.Dockerfile .
docker build -t hiteshnayak305/inbound-agent:3206.vb_15dcf73f6a_9-3 -f jnlp.Dockerfile .
docker build -t hiteshnayak305/kaniko:latest -f kaniko.Dockerfile .
docker build -t hiteshnayak305/k8s:1.29.2 -f k8s.Dockerfile .
docker build -t hiteshnayak305/eclipse-temurin:21-jdk-alpine -f jdk21.Dockerfile .
docker build -t hiteshnayak305/node:20-alpine -f node20.Dockerfile .
docker build -t hiteshnayak305/sonar-scanner-cli:5 -f ssc5.Dockerfile .
docker build -t hiteshnayak305/sonarqube:10.4.0-community -f sonarqube.Dockerfile .