pipeline {
  agent none
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
    // stage("Sonar: Quality Gate") {
    //   steps {
    //     timeout(time: 1, unit: 'HOURS') {
    //       waitForQualityGate abortPipeline: true
    //     }
    //   }
    // }
    stage('Build & Push Docker Images') {
      agent {
        kubernetes {
          defaultContainer 'jnlp'
          inheritFrom 'kaniko'
        }
      }
      steps {
        container('kaniko') {
          sh "/kaniko/executor --dockerfile `pwd`/gitea.Dockerfile --context `pwd` --destination=docker.io/hiteshnayak305/gitea:1.21.7-rootless"
          sh "/kaniko/executor --dockerfile `pwd`/jenkins.Dockerfile --context `pwd` --destination=docker.io/hiteshnayak305/jenkins:2.440.1-alpine"
          sh "/kaniko/executor --dockerfile `pwd`/jnlp.Dockerfile --context `pwd` --destination=docker.io/hiteshnayak305/inbound-agent:3206.vb_15dcf73f6a_9-7-alpine"
          sh "/kaniko/executor --dockerfile `pwd`/kaniko.Dockerfile --context `pwd` --destination=docker.io/hiteshnayak305/kaniko:debug"
          sh "/kaniko/executor --dockerfile `pwd`/k8s.Dockerfile --context `pwd` --destination=docker.io/hiteshnayak305/k8s:1.29.2"
          sh "/kaniko/executor --dockerfile `pwd`/jdk21.Dockerfile --context `pwd` --destination=docker.io/hiteshnayak305/eclipse-temurin:21-jdk-alpine"
          sh "/kaniko/executor --dockerfile `pwd`/node20.Dockerfile --context `pwd` --destination=docker.io/hiteshnayak305/node:20-alpine"
          sh "/kaniko/executor --dockerfile `pwd`/ssc5.Dockerfile --context `pwd` --destination=docker.io/hiteshnayak305/sonar-scanner-cli:5"
          sh "/kaniko/executor --dockerfile `pwd`/sonarqube.Dockerfile --context `pwd` --destination=docker.io/hiteshnayak305/sonarqube:10.4.1-community"
        }
      }
    }
  }
}
