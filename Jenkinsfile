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
                      sh ('docker build -t ncdevreg.ml:5000/flask_webapp:$GIT_BRANCH-$BUILD_NUMBER .')
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
                    sh ('docker push ncdevreg.ml:5000/flask_webapp:$GIT_BRANCH-$BUILD_NUMBER')
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
             git branch: 'ncdev22-18', url: 'https://github.com/neizmirasego/ncdevopsschool22'
             dir ('flask_webapp') {
                 script {
                        sh ('docker-compose build')
                        sh ('docker-compose up -d')
                 }
             }
           }
         }
   }
   post {
     success {
        withCredentials([string(credentialsId: 'botsecret', variable: 'TOKEN'),
        		  string(credentialsId: 'idchatncdev22', variable: 'CHAT_ID')])
            {
                sh  ("""
                        curl -s -X POST https://api.telegram.org/bot${TOKEN}/sendMessage -d chat_id=${CHAT_ID} -d parse_mode=markdown -d text='*$JOB_NAME* : RESULT *Branch*: $GIT_BRANCH *Build* : OK'
                    """)
            }
     }

     failure {
        withCredentials([string(credentialsId: 'botsecret', variable: 'TOKEN'),
        		  string(credentialsId: 'idchatncdev22', variable: 'CHAT_ID')])
            {
               sh  ("""
                       curl -s -X POST https://api.telegram.org/bot${TOKEN}/sendMessage -d chat_id=${CHAT_ID} -d parse_mode=markdown -d text='*$JOB_NAME* : RESULT  *Branch*: $GIT_BRANCH *Build* : NOT ok: ${env.STAGEBUILD} ${env.STAGEPUSH}'
                    """)
            }
       }
   }
}
