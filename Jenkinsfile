pipeline {
    agent any
    stages {
        stage('Building docker image') {
            steps {
                echo 'Start building image'
                dir ('NC2022') {
                      sh '''
                          docker build -t ncdevreg.ml/application-$BUILD_NUMBER .
                          docker login https://ncdevreg.ml:5000 -u "admin" -p "ncdev" 
                          docker push ncdevreg.ml/application-$BUILD_NUMBER        
                      '''
                }
            }
        }
    }
}
