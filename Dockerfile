FROM tomcat
RUN mkdir bin/tomcat
RUN cd /bin/tomcat && wget http://ftp.tsukuba.wide.ad.jp/software/apache/tomcat/tomcat-8/v8.5.30/bin/apache-tomcat-8.5.30.tar.gz
RUN cd /bin/tomcat && tar -xvf apache-tomcat-8.5.30.tar.gz
COPY tomcat-users.xml/bin/tomcat/apache-tomcat-8.5.30/conf
COPY server.xml/bin/tomcat/apache-tomcat-8.5.30/conf
