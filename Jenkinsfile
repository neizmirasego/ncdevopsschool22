env.STAGEBUILD = ''
env.STAGEPUSH = ''
pipeline {
    agent any
    stages {
        stage('Checkout code') {
            steps {
                checkout scm
            }
        }
        stage('Building docker image') {
            steps {
                echo 'Start building docker image'
                dir ('flask_webapp') {
                      sh ('docker build -t ncdevreg.ml:5000/flask_webapp-$GIT_BRANCH:$BUILD_NUMBER .')
                }
            }
            post {
         	    failure {
         		      script {
         			        env.STAGEBUILD = "Failure at stage BUILDING docker image"
                         }
         	            }
                    }
        }
        stage('Push docker image to local registry') {
            steps {
                echo 'Login docker registry and push docker image'
                withCredentials([usernamePassword(credentialsId: 'localregistry',
                                                  passwordVariable: 'localregistryPassword',
                                                  usernameVariable: 'localregistryUser')])
                  {
                    sh ('docker login https://ncdevreg.ml:5000 -u $localregistryUser -p $localregistryPassword')
                    sh ('docker push ncdevreg.ml:5000/flask_webapp-$GIT_BRANCH:$BUILD_NUMBER')
                  }
           }
           post {
         	   failure {
         		     script {
         			       env.STAGEPUSH = "Failure at stage PUSH docker image"
                        }
         	           }
                   }
         }
         stage('deploy'){
           steps {
             withCredentials([usernamePassword(credentialsId: 'localregistry',
                                               passwordVariable: 'localregistryPassword',
                                               usernameVariable: 'localregistryUser')])
                {
                  dir ('flask_webapp') {
                  	script {
                  		env.SERVICES=sh("docker service ls --filter name=flaskkk-stack_webapp --quiet | wc -l")
                        if ( sh('${env.SERVICES} -eq 0 ')) {
            				sh("docker stack deploy --compose-file docker-compose.yml flask-stack --with-registry-auth")}
          			else
            				{sh("docker service update --image ncdevreg.ml:5000/flask_webapp-$GIT_BRANCH:$BUILD_NUMBER flaskkk-stack_webapp")}
                        //sh ('docker-compose up -d')
                        //sh ('docker stack deploy --compose-file docker-compose.yml flaskkk-stack --with-registry-auth')
               }}
             }
           }
         }
   }

}
