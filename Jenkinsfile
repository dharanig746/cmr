pipeline {
    agent any
    stages{
        stage("git checkout"){
        steps{
            git branch: 'main', credentialsId: '8d699274-d35f-4015-9550-443cf6f18b04', url: 'https://github.com/dharanig746/cmr.git'
        }    
        }
        stage("maven build"){
            steps{
                sh "mvn clean install"
            }
        }
        stage("build docker image"){
            steps{
                sh "docker build -t cmr/myapp:1.0 ."
                withCredentials([string(credentialsId: 'docker-password', variable: 'dockerhubpwd')]) {
                sh "docker login -u monith -p ${dockerhubpwd}"
                sh "docker tag cmr/myapp:1.0 monith/cmr:1.0"
                sh "docker push monith/cmr:1.0"
                    }
                
                
            }
        }
    }    
}    
