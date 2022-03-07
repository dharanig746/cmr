FROM ubuntu

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://www-eu.apache.org/dist/tomcat/tomcat-8/v8.5.40/bin/apache-tomcat-8.5.40.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.40/* /opt/tomcat/.

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080
COPY tomcat-users.xml/bin/tomcat/apache-tomcat-8.5.30/conf
COPY server.xml/bin/tomcat/apache-tomcat-8.5.30/conf
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
