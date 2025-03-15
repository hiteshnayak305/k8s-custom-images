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
          inheritFrom 'ssc'
        }
      }
      steps {
        container('ssc') {
          withSonarQubeEnv('sonarqube') {
            sh ('sonar-scanner -Dsonar.host.url=$SONAR_HOST_URL -Dsonar.token=$SONAR_AUTH_TOKEN')
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
          inheritFrom 'docker-buildkit'
        }
      }
      steps {
        script {
          env.IMAGE = env.BRANCH_NAME.toString().split("@")[0];
          env.VERSION = env.BRANCH_NAME.toString().split("@")[1];
          env.CONTEXT = env.BRANCH_NAME.toString();
        }
        container('docker') {
          withCredentials([file(credentialsId: 'docker-harbor', variable: 'CONFIG')]) {
            sh '''
              mkdir -p /root/.docker && cp $CONFIG /root/.docker/config.json
              docker buildx build --platform linux/amd64 -t docker.io/${env.IMAGE}:${env.VERSION} -f `pwd`/${env.CONTEXT}/Dockerfile --push --build-arg=VERSION=${env.VERSION} `pwd`
            '''
          }
        }
      }
    }
  }
}
