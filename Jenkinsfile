pipeline {
  agent none
  environment {
    VERSION = "X.X.X"
  }
  options {
    buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '7', numToKeepStr: '3')
  }
  stages {
    stages {
      stage('Template') {
        agent {
          kubernetes {
            defaultContainer 'jnlp'
            inheritFrom 'default'
          }
        }
        steps {
          sh 'Template Jenkinsfile'
        }
      }
    }
    // stage('Sonar: Scanner') {
    //   agent {
    //     kubernetes {
    //       defaultContainer 'jnlp'
    //       inheritFrom 'ssc5'
    //     }
    //   }
    //   steps {
    //     container('ssc5') {
    //       withSonarQubeEnv('sonarqube') {
    //         sh "sonar-scanner -Dsonar.host.url=${SONAR_HOST_URL} -Dsonar.token=${SONAR_AUTH_TOKEN} -Dsonar.branch.name=${env.BRANCH}"
    //       }
    //     }
    //   }
    // }
    // stage("Sonar: Quality Gate") {
    //   steps {
    //     timeout(time: 1, unit: 'HOURS') {
    //       waitForQualityGate abortPipeline: false
    //     }
    //   }
    // }
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
