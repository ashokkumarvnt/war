FROM centos:latest
RUN yum install java -y
RUN yum update -y
RUN mkdir opt/tomcat
WORKDIR opt/tomcat
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73.tar.gz .
RUN tar -xvzf apache-tomcat-9.0.73.tar.gz 
RUN tar -xvzf apache-tomcat-9.0.73/* /opt/tomcat
ADD target/war.war /opt/tomcat/webapps
EXPOSE 8080
CMD ["/opt/tomcat/catalina.sh", "run"]