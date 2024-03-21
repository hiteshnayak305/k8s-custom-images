pipeline {
  agent none
  environment {
    VERSION = "X.X.X"
  }
  options {
    buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '7', numToKeepStr: '3')
  }
  stages {
    stage('Template') {
      agent {
        kubernetes {
          defaultContainer 'jnlp'
          inheritFrom 'default'
        }
      }
      steps {
        sh "echo 'skipping...'"
      }
    }
    // stage('Build & Push Docker Image') {
    //   agent {
    //     kubernetes {
    //       defaultContainer 'jnlp'
    //       inheritFrom 'kaniko'
    //     }
    //   }
    //   steps {
    //     container('kaniko') {
    //       sh "/kaniko/executor --context `pwd` --dockerfile `pwd`/Dockerfile --build-arg=VERSION=${VERSION} --destination=docker.io/hiteshnayak305/<name>:${VERSION}"
    //     }
    //   }
    // }
  }
}
