pipeline {
  agent none
  options {
    buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '7', numToKeepStr: '3')
  }
  stages {
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
          sh "/kaniko/executor --context `pwd` --dockerfile `pwd`/${env.CONTEXT}/Dockerfile --build-arg=VERSION=${env.VERSION} --destination=docker.io/${env.IMAGE}:${env.VERSION}"
        }
      }
    }
  }
}
