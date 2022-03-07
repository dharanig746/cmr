pipeline {
    agent any
    tools {
        maven 'MAVEN'
    }

    stages {
        stage('Build' ) {
            steps {
                echo 'Hello World'
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'c448291c-aa18-4dd1-800e-2922c2689e72', url: 'https://github.com/dharanig746/cmr.git']]])
                sh "mvn -Dmaven.test.failureignore=true clean package"
            }
        }
    }
    post {
        always {
            junit(
                allowEmptyResults:true,
                testResults: '*test-reports/*xml'
                )
        }
    }
}
