
docker build -t hiteshnayak305/gitea:1.21.7-rootless -f gitea.Dockerfile .
docker build -t hiteshnayak305/jenkins:2.440.1-jdk17 -f jenkins.Dockerfile .
docker build -t hiteshnayak305/inbound-agent:3206.vb_15dcf73f6a_9-3 -f jenkins.inbound-agent.Dockerfile .
docker build -t hiteshnayak305/sonarqube:10.4.0-community -f sonarqube.Dockerfile .