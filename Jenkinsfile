pipeline {
    agent any
    stages {
        stage('Building docker image') {
            steps {
                echo 'Start building image'
                dir ('jenkins-test') {
                      sh 'docker build -t application-$BUILD_NUMBER:$BRANCH_NAME .'
                }
            }
        }
    }
}
