# Uporabljene knjižnice

#### Pri projektu smo uporabili <a href="https://spring.io/projects/spring-boot">Spring boot framework</a>
```
<parent>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-parent</artifactId>
	<version>2.0.0.RELEASE</version>
</parent>
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-web</artifactId>
</dependency>
```
#### Za podatkovno bazo smo uporabili <a href ="https://www.mysql.com/">MySql</a>
```
<dependency>
	<groupId>mysql</groupId>
	<artifactId>mysql-connector-java</artifactId>
	<version>8.0.11</version>
</dependency>
```
###### Za dostop do baze smo si pomagali z Spring JDBC 
```
<dependency>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-jdbc</artifactId>
</dependency>
```
## Preostale back-end knjižnice
#### Pri pošiljanju templatov na email smo si pomagali s <a href="https://freemarker.apache.org/index.html">Apache FreeMarker</a>
```
<dependency>
	<groupId>org.freemarker</groupId>
	<artifactId>freemarker</artifactId>
	<version>2.3.26-incubating</version>
</dependency>
```
#### Za ustvarjanje pdf-jev smo uporabili <a href="https://pdfbox.apache.org/">Apache PDFBox</a>
```
<dependency>
	<groupId>org.apache.pdfbox</groupId>
	<artifactId>pdfbox</artifactId>
	<version>2.0.8</version>
	<scope>compile</scope>
</dependency>
```
### Za server je bil uporabljen Apache Tomcat 
```
<dependency>
	<groupId>org.apache.tomcat.embed</groupId>
	<artifactId>tomcat-embed-jasper</artifactId>
</dependency>
```
