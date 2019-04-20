FROM maven:3.6.1-jdk-8-alpine as build
WORKDIR /app
RUN touch test
COPY pom.xml .
RUN mvn verify
COPY src/ /app/src/
RUN mvn clean package

FROM tomcat:alpine
RUN mkdir -p $CATALINA_HOME/conf/Catalina/localhost/
RUN echo '<Context path="" docBase="whiteapp"/>' > $CATALINA_HOME/conf/Catalina/localhost/ROOT.xml
COPY --from=build /app/target/*.war $CATALINA_HOME/webapps/
EXPOSE 8080