FROM tomcat:9

COPY ./target/*.war /usr/local/tomcat/webapps/

RUN mkdir /usr/local/tomcat/webapps/ROOT/

RUN unzip /usr/local/tomcat/webapps/WebApp.war -d /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080

CMD ["catalina.sh","run"]
