pipeline {
    agent any
    stages {
        stage('Building docker image') {
            steps {
                echo 'Start building docker image'
                dir ('NC2022') {
                      sh '''
                          docker build -t ncdevreg.ml:5000/application-$BUILD_NUMBER .
                      '''
                }
            }
        }
        stage('Push docker image to local registry') {
            steps {
                echo 'Start push docker image'
                withCredentials([usernamePassword(credentialsId: 'localregisty', passwordVariable: 'localregistyPassword', usernameVariable: 'localregistyUser')]) {
                      sh '''
                          docker login https://ncdevreg.ml:5000 -u ${env.localregistyUser} -p ${env.localregistyPassword}
                          docker push ncdevreg.ml:5000/application-$BUILD_NUMBER
                      '''
                }
            }
      }
   }
}
