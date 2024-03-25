FROM maven:3.8.3-openjdk-17 AS Build
RUN git clone https://github.com/bharatkumarSree/SPC.git
WORKDIR SPC
RUN mvn clean install

FROM openjdk:17-alpine
LABEL author="Bharat Kumar"
WORKDIR /tmp/
COPY --from=Build SPC/target/*.jar /tmp/
EXPOSE 8080
CMD ["java","-jar","spring-petclinic-3.2.0-SNAPSHOT.jar"]