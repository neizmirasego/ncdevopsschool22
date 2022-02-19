pipeline {
    agent any
    stages {
        stage('Building docker image') {
            steps {
                echo 'Start building image'
                dir ('NC2022') {
                      sh 'docker build -t application-$BUILD_NUMBER:$BRANCH_NAME .'
                }
            }
        }
    }
}
