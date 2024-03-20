pipeline {
  agent none
  environment {
    GITEA_TAG = "1.21.7-rootless"
    JENKINS_TAG = "2.440.1-alpine"
    INBOUND_AGENT_TAG = "3206.vb_15dcf73f6a_9-7-alpine"
    KANIKO_TAG = "debug"
    K8S_TAG = "1.29.2"
    ECLIPSE_TEMURIN_TAG = "21-jdk-alpine"
    NODE_TAG = "20-alpine"
    SSC_TAG = "5"
    SONARQUBE_TAG = "10.4.1-community"
  }
  options {
    buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '7', numToKeepStr: '3')
  }
  stages {
    stage('Sonar: Scanner') {
      agent {
        kubernetes {
          defaultContainer 'jnlp'
          inheritFrom 'ssc5'
        }
      }
      steps {
        container('ssc5') {
          withSonarQubeEnv('sonarqube') {
            sh "sonar-scanner -Dsonar.host.url=${SONAR_HOST_URL} -Dsonar.token=${SONAR_AUTH_TOKEN}"
          }
        }
      }
    }
    stage("Sonar: Quality Gate") {
      steps {
        timeout(time: 1, unit: 'HOURS') {
          waitForQualityGate abortPipeline: false
        }
      }
    }
    stage('Build & Push Docker Images') {
      agent {
        kubernetes {
          defaultContainer 'jnlp'
          inheritFrom 'kaniko'
        }
      }
      steps {
        container('kaniko') {
          sh "/kaniko/executor --context `pwd` --dockerfile `pwd`/gitea.Dockerfile      --build-arg=TAG=${GITEA_TAG} --destination=docker.io/hiteshnayak305/${GITEA_TAG}"
          sh "/kaniko/executor --context `pwd` --dockerfile `pwd`/jenkins.Dockerfile    --build-arg=TAG=${JENKINS_TAG} --destination=docker.io/hiteshnayak305/${JENKINS_TAG}"
          sh "/kaniko/executor --context `pwd` --dockerfile `pwd`/jnlp.Dockerfile       --build-arg=TAG=${INBOUND_AGENT_TAG} --destination=docker.io/hiteshnayak305/inbound-agent:${INBOUND_AGENT_TAG}"
          sh "/kaniko/executor --context `pwd` --dockerfile `pwd`/kaniko.Dockerfile     --build-arg=TAG=${KANIKO_TAG} --destination=docker.io/hiteshnayak305/kaniko:${KANIKO_TAG}"
          sh "/kaniko/executor --context `pwd` --dockerfile `pwd`/k8s.Dockerfile        --build-arg=TAG=${K8S_TAG} --destination=docker.io/hiteshnayak305/k8s:${K8S_TAG}"
          sh "/kaniko/executor --context `pwd` --dockerfile `pwd`/jdk.Dockerfile        --build-arg=TAG=${ECLIPSE_TEMURIN_TAG} --destination=docker.io/hiteshnayak305/eclipse-temurin:${ECLIPSE_TEMURIN_TAG}"
          sh "/kaniko/executor --context `pwd` --dockerfile `pwd`/node.Dockerfile       --build-arg=TAG=${NODE_TAG} --destination=docker.io/hiteshnayak305/node:${NODE_TAG}"
          sh "/kaniko/executor --context `pwd` --dockerfile `pwd`/ssc.Dockerfile        --build-arg=TAG=${SSC_TAG} --destination=docker.io/hiteshnayak305/sonar-scanner-cli:${SSC_TAG}"
          sh "/kaniko/executor --context `pwd` --dockerfile `pwd`/sonarqube.Dockerfile  --build-arg=TAG=${SONARQUBE_TAG} --destination=docker.io/hiteshnayak305/sonarqube:${SONARQUBE_TAG}"
        }
      }
    }
  }
}
