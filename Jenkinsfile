pipeline {
    agent any

    stages {
        stage('create docker image') {
            node {
                echo 'Pulling...' + env.BRANCH_NAME
                checkout scm
            } 
            steps {
                echo 'Start building image'
                dir ('jenkins-test') {
                      sh 'docker build -t application:$BUILD_NUMBER .'
                }
            }
        }
    }
}
