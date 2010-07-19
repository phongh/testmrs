require 'java'

def setup_openmrs_classpath
  $CLASSPATH << 'lib/log4j.xml'
  puts "Setting up classpath"
  [ "lib/java/openmrs-api-1.7.0.14010-dev.jar",
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
  
  #trying to get log4j to work right (and giving up)
  #java_import "org.apache.commons.logging.LogFactory"
  #clazz = Java::org.springframework.context.support.ClassPathXmlApplicationContext
  #logger = LogFactory.getLog(clazz.java_class)
  #puts "It should say Here! after this"
  #logger.warn("Here!")
end

def import_openmrs_classes
  puts "Import OpenMRS's classes"
  [ "EncounterType",
    "Patient",
    "PatientIdentifier",
    "Person",
    "PersonName",
    "Location",
    "User",
    "api.context.Context",
    "util.OpenmrsUtil"
  ].each do |clazz|
    java_import "org.openmrs.#{clazz}"
  end
  
  $omrs = Context # o is a shortcut for the OpenMRS Context
end

def get_runtime_properties
  puts "Looking for runtime properties file..."
  webapp = "openmrs" # String webapp = WebConstants.WEBAPP_NAME;

  env_filename = ENV["#{webapp.upcase}_RUNTIME_PROPERTIES_FILE"]
  if env_filename
    puts "Found #{webapp.upcase}_RUNTIME_PROPERTIES_FILE environment variable: #{env_filename}"
    # todo try/catch around the following to give a nice error message if the environment variable exists but the file doesn't
    @runtime_props = load_java_properties env_filename
  else
    puts "Did not find #{webapp.upcase}_RUNTIME_PROPERTIES_FILE environment variable"
  end
  return @runtime_props if @runtime_props
  
  filename = "#{OpenmrsUtil.application_data_directory}#{webapp}-runtime.properties"
  puts "Looking in default location: #{filename}"
  # todo try/catch
  @runtime_props = load_java_properties filename
  puts "Found runtime properties"
  return @runtime_props if @runtime_props
  
  # todo check current directory? (the java version does)
  
  return nil  
end

def load_java_properties filename
  props = Java::java.util.Properties.new
  props.load Java::java.io.InputStreamReader.new(Java::java.io.FileInputStream.new(filename), "UTF-8")
  return props
end

def startup_openmrs_web runtime_properties
  puts "Starting up OpenMRS..."
  puts "    (connection.url = #{runtime_properties['connection.url']})"

  puts "Creating Spring ApplicationContext..."
  ctx = Java::org.springframework.context.support.ClassPathXmlApplicationContext.new "applicationContext-service.xml"

  puts "Opening an OpenMRS Session"  
  $omrs.open_session

  # load_bundled_module ??
  
  puts "Calling Context.startup"
  begin
    $omrs.startup runtime_properties
  rescue => e
    puts "The error was a #{e.class} and it says #{e}"
    i = 0;
    e.backtrace.each do |line|
      puts "#{i}: #{line}"
      i += 1
    end
  end
  
  puts "OpenMRS started."
end

def startup_openmrs_standalone runtime_properties
  puts "Starting up OpenMRS..."
  puts "    (connection.url = #{runtime_properties['connection.url']})"
  
  puts "Calling Context.startup"
  $omrs.startup runtime_properties['connection.url'], runtime_properties['connection.username'], runtime_properties['connection.password'], runtime_properties

  puts "Opening an OpenMRS Session"  
  $omrs.open_session
  
  puts "OpenMRS started."
end

setup_openmrs_classpath

import_openmrs_classes

props = get_runtime_properties

if props.nil?
  puts "Could not find runtime properties"
  raise SystemExit.new
end

startup_openmrs_standalone props # need to get startup_openmrs_web working