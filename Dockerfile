FROM tomcat:9-jre9 
COPY ./webapp-dockerhub-deployment.war /usr/local/tomcat/webapps
