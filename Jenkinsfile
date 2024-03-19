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
          sh "/kaniko/executor --dockerfile `pwd`/jenkins.Dockerfile --context `pwd` --destination=docker.io/hiteshnayak305/jenkins:2.440.1-jdk17"
          sh "/kaniko/executor --dockerfile `pwd`/jenkins.inbound-agent.Dockerfile --context `pwd` --destination=docker.io/hiteshnayak305/inbound-agent:3206.vb_15dcf73f6a_9-3"
          sh "/kaniko/executor --dockerfile `pwd`/sonarqube.Dockerfile --context `pwd` --destination=docker.io/hiteshnayak305/sonarqube:10.4.0-community"
        }
      }
    }
  }
}
