#! /bin/bash

git clone https://github.com/spring-projects/spring-petclinic



# Edit pom.xml
sed -i "3 i  <packaging>war</packaging> " /home/pet-clinic/.jenkins/workspace/app/spring-petclinic/pom.xml
sed -i '3s/^/  /' /home/pet-clinic/.jenkins/workspace/app/spring-petclinic/pom.xml

sed -i "70 i <dependency>  " /home/pet-clinic/.jenkins/workspace/app/spring-petclinic/pom.xml
sed -i '70s/^/    /' /home/pet-clinic/.jenkins/workspace/app/spring-petclinic/pom.xml

sed -i "71 i <groupId>org.springframework.boot</groupId> " /home/pet-clinic/.jenkins/workspace/app/spring-petclinic/pom.xml
sed -i '71s/^/      /' /home/pet-clinic/.jenkins/workspace/app/spring-petclinic/pom.xml

sed -i "72 i  <artifactId>spring-boot-starter-tomcat</artifactId> " /home/pet-clinic/.jenkins/workspace/app/spring-petclinic/pom.xml
sed -i '72s/^/      /' /home/pet-clinic/.jenkins/workspace/app/spring-petclinic/pom.xml

sed -i "73 i  <scope>provided</scope> " /home/pet-clinic/.jenkins/workspace/app/spring-petclinic/pom.xml
sed -i '73s/^/      /' /home/pet-clinic/.jenkins/workspace/app/spring-petclinic/pom.xml

sed -i "74 i  </dependency>  " /home/pet-clinic/.jenkins/workspace/app/spring-petclinic/pom.xml
sed -i '74s/^/    /' /home/pet-clinic/.jenkins/workspace/app/spring-petclinic/pom.xml


# Edit build.gradle
sed -i "42 i    providedRuntime 'org.springframework.boot:spring-boot-starter-tomcat'  " /home/pet-clinic/.jenkins/workspace/app/spring-petclinic/build.gradle
sed -i '42s/^/  /' /home/pet-clinic/.jenkins/workspace/app/spring-petclinic/build.gradle


sed -i "6 i id 'war' " /home/pet-clinic/.jenkins/workspace/app/spring-petclinic/build.gradle
sed -i '6s/^/  /' /home/pet-clinic/.jenkins/workspace/app/spring-petclinic/build.gradle

sed -i "9 i apply plugin: 'war'  " /home/pet-clinic/.jenkins/workspace/app/spring-petclinic/build.gradle


# Edit PetClinicApplication.java
sed -i "22 i  import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;  " /home/pet-clinic/.jenkins/workspace/app/spring-petclinic/src/main/java/org/springframework/samples/petclinic/PetClinicApplication.java

sed -i '32s/public class PetClinicApplication {/public class PetClinicApplication extends SpringBootServletInitializer {/' /home/pet-clinic/.jenkins/workspace/app/spring-petclinic/src/main/java/org/springframework/samples/petclinic/PetClinicApplication.java

mvn spring-javaformat:apply
mvn clean
mvn package

cp /home/pet-clinic/.jenkins/workspace/app/spring-petclinic/target/spring-petclinic-3.1.0-SNAPSHOT.war  /home/pet-clinic/tomcat/apache-tomcat-10.1.10/webapps


