pipeline {
    agent any
    stages {
        stage('Building docker image') {
            steps {
                echo 'Start building image'
                dir ('NC2022') {
                      sh '''
                         docker build -t application-$BUILD_NUMBER:$BRANCH_NAME .
                         docker push gcr.io/gifted-monitor-338716/application-$BUILD_NUMBER:$BRANCH_NAME        
                      '''
                }
            }
        }
    }
}
