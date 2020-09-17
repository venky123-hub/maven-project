FROM node:current-slim
COPY ./webapp/target/*.war /usr/local/tomcat/webapps/

EXPOSE 8081
CMD ["catalina.sh","run"]
