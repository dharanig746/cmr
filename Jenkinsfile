node('master')
    
    stage('Git Clone/Pull'){
        git branch: 'main', 
			url: 'https://github.com/dharanig746/cmr.git'
    }
	
	stage('Build Docker Image'){
		sh "mvn clean package"
		sh "mv target/*.war target/myweb.war"
		sh "docker build -t dharanig746/cmr/my-app:1.0 ."
	}
	
	stage('Push Image'){
	  withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerHubPwd')]) {
         sh "docker login -u dharanig746/cmr -p ${dockerHubPwd}"
      }
	  sh "docker push dharanig746/cmr/my-app:1.0"
	}
	
	stage('Delete Old Container'){
	   sshagent (credentials: ['dev-docker']) {
	       try{
		     def dockrRm = "docker rm -f my-app"
			 def dockrRmImage = "docker rmi  dharanig746/cmr/my-app:1.0"
	         sh "ssh -o StrictHostKeyChecking=no ec2-user@ 3.15.194.199 ${dockrRm} "
			 sh "ssh -o StrictHostKeyChecking=no ec2-user@ 3.15.194.199 ${dockrRmImage} "
		   }catch(e){
			  echo "container my-app not found" 
		   }
	   }
	   
	}
	
	stage('Deploy On main'){
		sshagent (credentials: ['dev-docker']) {
		 def dockerRun = "docker run -d -p 8080:8080 --name=my-app dharanig746/cmr/my-app:1.0"
		 sh "ssh -o StrictHostKeyChecking=no ec2-user@ 3.15.194.199 ${dockerRun} "
		}
	}
    
