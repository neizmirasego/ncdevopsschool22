pipeline {
    agent any

    stages {
        stage('create docker image') {
            steps {
                echo 'Start building image'
                dir ('docker') {
                      sh 'docker build . '
                }
            }
        }
    }
}
