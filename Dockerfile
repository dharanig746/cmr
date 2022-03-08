FROM tomcat9.0
COPY /var/lib/jenkins/workspace/pi/targets/my-app1.0-SNAPSHOT.jar /var/lib/tomcat9/webapps/my-app1.0-SNAPSHOT.jar
