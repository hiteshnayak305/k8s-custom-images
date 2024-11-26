pipeline {
  agent none
  options {
    buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '7', numToKeepStr: '3')
  }
  stages {
    stage('Sonar Scanner') {
      when {
        branch comparator: 'GLOB', pattern: 'master'
        beforeOptions true
      }
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
        timeout(time: 1, unit: 'HOURS') {
          waitForQualityGate abortPipeline: false
        }
      }
    }
    stage('Build & Push Docker Image') {
      when {
        branch comparator: 'GLOB', pattern: 'hiteshnayak305/**'
        beforeOptions true
      }
      agent {
        kubernetes {
          defaultContainer 'jnlp'
          inheritFrom 'kaniko'
        }
      }
      steps {
        script {
          env.IMAGE = env.BRANCH_NAME.toString().split("@")[0];
          env.VERSION = env.BRANCH_NAME.toString().split("@")[1];
          env.CONTEXT = env.BRANCH_NAME.toString();
        }
        container('kaniko') {
          withCredentials([file(credentialsId: 'docker-harbor', variable: 'CONFIG')]) {
            sh """
              mkdir -p /kaniko/.docker && cat $CONFIG > /kaniko/.docker/config.json
              /kaniko/executor --context `pwd` --dockerfile `pwd`/${env.CONTEXT}/Dockerfile --build-arg=VERSION=${env.VERSION} --destination=docker.io/${env.IMAGE}:${env.VERSION}
              """
          }
        }
      }
    }
  }
}
