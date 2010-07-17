require 'java'

$CLASSPATH << 'lib/log4j.xml'

["lib/java/openmrs-api-1.7.0.14010-dev.jar",
"lib/java/antlr/antlr_2.7.6.jar",
"lib/java/commons-beanutils/commons-beanutils-1.7.0.jar",
"lib/java/commons-collections/commons-collections-3.2.jar",
"lib/java/commons-fileupload/commons-fileupload-1.1.1.jar",
"lib/java/slf4j/slf4j-api-1.5.6.jar",
"lib/java/slf4j/slf4j-log4j12-1.5.6.jar",
"lib/java/slf4j/jcl-over-slf4j-1.5.6.jar",
"lib/java/commons-pool/commons-pool-1.2.jar",
"lib/java/dom4j/dom4j-1.6.1.jar",
"lib/java/ehcache/ehcache-1.2.4.jar",
"lib/java/jakarta-taglibs/taglibs-page-1.1.jar",
"lib/java/jstl/jstl-1.1.jar",
"lib/java/jta/jta.jar",
"lib/java/junit/xmlunit-1.2.jar",
"lib/java/junit/hsqldb-1.8.0.10.jar",
"lib/java/junit/dbunit-2.4.4.jar",
"lib/java/mysql-connector-java/mysql-connector-java-5.1.7-bin.jar",
"lib/java/commons-beanutils/commons-beanutils-bean-collections-1.7.0.jar",
"lib/java/commons-beanutils/commons-beanutils-core-1.7.0.jar",
"lib/java/hibernate/hibernate325-mod.jar",
"lib/java/jakarta-taglibs/taglibs-request-1.1.jar",
"lib/java/jakarta-taglibs/taglibs-response-1.1.jar",
"lib/java/jakarta-taglibs/taglibs-standard-1.1.jar",
"lib/java/tomcat/jsp-api.jar",
"lib/java/tomcat/servlet-api.jar",
"lib/java/tomcat/catalina.jar",
"lib/java/tomcat/naming-resources.jar",
"lib/java/mail/activation.jar",
"lib/java/mail/mail.jar",
"lib/java/saxon/saxon8.jar",
"lib/java/saxon/saxon8-dom.jar",
"lib/java/xerces/xercesImpl.jar",
"lib/java/xerces/xml-apis.jar",
"lib/java/jakarta-log4j/log4j-1.2.15.jar",
"lib/java/c3p0/c3p0-0.9.1.jar",
"lib/java/hl7api/hapi-0.5.jar",
"lib/java/simple/simple-xml-1.6.1-mod.jar",
"lib/java/stax/stax-1.2.0.jar",
"lib/java/stax/stax-api-1.0.1.jar",
"lib/java/jfreechart/jcommon-1.0.15.jar",
"lib/java/jfreechart/jfreechart-1.0.12.jar",
"lib/java/reflection-utils/reflectutils-0.9.14.jar",
"lib/java/junit/junit-4.8.1.jar",
"lib/java/junit/junit-dep-4.8.1.jar",
"lib/java/velocity/velocity-1.6-beta1.jar",
"lib/java/commons-lang/commons-lang-2.4.jar",
"lib/java/benerator/databene-benerator-0.5.5.jar",
"lib/java/benerator/databene-commons-0.4.5.jar",
"lib/java/benerator/databene-webdecs-0.4.5.jar",
"lib/java/commons-io/commons-io-1.4.jar",
"lib/java/dwr/dwr-205.jar",
"lib/java/liquibase/liquibase-1.9.4-mod.jar",
"lib/java/xstream/xstream-1.3.1.jar",
"lib/java/json/jackson-core-asl-1.5.0.jar",
"lib/java/json/jackson-mapper-asl-1.5.0.jar",
"/home/djazayeri/workspace35/openmrs-trunk/lib/spring-framework/org.springframework.aop-3.0.2.RELEASE.jar",
"/home/djazayeri/workspace35/openmrs-trunk/lib/spring-framework/org.springframework.asm-3.0.2.RELEASE.jar",
"/home/djazayeri/workspace35/openmrs-trunk/lib/spring-framework/org.springframework.beans-3.0.2.RELEASE.jar",
"/home/djazayeri/workspace35/openmrs-trunk/lib/spring-framework/org.springframework.context-3.0.2.RELEASE.jar",
"/home/djazayeri/workspace35/openmrs-trunk/lib/spring-framework/org.springframework.context.support-3.0.2.RELEASE.jar",
"/home/djazayeri/workspace35/openmrs-trunk/lib/spring-framework/org.springframework.core-3.0.2.RELEASE.jar",
"/home/djazayeri/workspace35/openmrs-trunk/lib/spring-framework/org.springframework.expression-3.0.2.RELEASE.jar",
"/home/djazayeri/workspace35/openmrs-trunk/lib/spring-framework/org.springframework.jdbc-3.0.2.RELEASE.jar",
"/home/djazayeri/workspace35/openmrs-trunk/lib/spring-framework/org.springframework.orm-3.0.2.RELEASE.jar",
"/home/djazayeri/workspace35/openmrs-trunk/lib/spring-framework/org.springframework.test-3.0.2.RELEASE.jar",
"/home/djazayeri/workspace35/openmrs-trunk/lib/spring-framework/org.springframework.transaction-3.0.2.RELEASE.jar",
"lib/java/spring-framework/org.springframework.web-3.0.2.RELEASE.jar",
"lib/java/spring-framework/org.springframework.web.servlet-3.0.2.RELEASE.jar",
"lib/java/spring-framework/org.springframework.aspects-3.0.2.RELEASE.jar",
"lib/java/ant-contrib/ant-contrib-1.0b2.jar",
"lib/java/antlr/antlr-runtime-3.2.jar",
"lib/java/asm/asm-2.2.3.jar",
"lib/java/asm/asm-commons-2.2.3.jar",
"lib/java/asm/asm-util-2.2.3.jar",
"lib/java/cglib/cglib-nodep-2.2.jar",
"lib/java/spring-framework/com.springsource.org.aopalliance-1.0.0.jar"
].each do |jar|
    require "#{jar}"
end

["Patient",
 "Person",
 "PersonName",
 "api.context.Context"
].each do |clazz|
    java_import "org.openmrs.#{clazz}"
end

puts "Starting up OpenMRS..."
Context.startup "jdbc:mysql://localhost:3306/haitimdr?autoReconnect=true&sessionVariables=storage_engine=InnoDB&useUnicode=true&characterEncoding=UTF-8", "openmrs", "pa55ionFruit", nil

puts "Opening a session..."
Context.open_session