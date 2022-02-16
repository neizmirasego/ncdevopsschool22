pipeline {
    agent any

    stages {
        stage('create docker image') {
            steps {
                echo 'Start building image'
                dir ('jenkins-test') {
                      sh '''
		      docker build -t application:$BUILD_NUMBER .
		      echo git rev-parse --abbrev-ref HEAD
                      '''
                }
            }
        }
    }
}
