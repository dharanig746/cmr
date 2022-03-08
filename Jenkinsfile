pipeline {
    agent any
    stages{
    stages ("Git Checkout"){
         steps{
            git credentialsId: 'github', url:'https://github.com/dharanig746/cmr.git'
        }
        }
    stage("Maven Build"){
         steps{
              sh "mvn clean install"
              }
             }
     stage("Building image"){
         steps{
            sh "docker build -t cmr-repo/myapp:1.0 ."
            sh "docker run -dt cmr-repo/myapp:1.0 /bin/bash"
            sh "docker tag cmr-repo/myapp:1.0 dharanig746/cmr-repo:1.0"
            sh "docker push dharanig746/cmr-repo:1.0"
                    }
                  }
                 }
