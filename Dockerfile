#
# MockServer Dockerfile
#
# https://github.com/discoverydev/mockserver
# http://www.mock-server.com
#

# pull base image
FROM java

# maintainer details
MAINTAINER ADS Discoverydev "adsdiscoveryteam@gmail.com"

# download MockServer
RUN  \
  mkdir -p /opt/mockserver ; \
  wget -O /opt/mockserver/mock-0.1-SNAPSHOT.jar "http://192.168.8.31:8081/service/local/artifact/maven/content?r=snapshots&g=com.ads&a=mock&v=LATEST" --content-disposition || true ; \
  wget -O /opt/mockserver/mockserver-netty-jar-with-dependencies.jar https://oss.sonatype.org/content/repositories/releases/org/mock-server/mockserver-netty/3.10.1/mockserver-netty-3.10.1-jar-with-dependencies.jar ; \
  wget -O /opt/mockserver/run_mockserver.sh https://raw.github.com/jamesdbloom/mockserver/master/docker/run_mockserver.sh ; \
  chmod +x /opt/mockserver/run_mockserver.sh

# set working directory
WORKDIR /opt/mockserver

# expose ports.
EXPOSE 1080 1090

# define default command.
CMD ["java", "-Dfile.encoding=UTF-8", "-Dmockserver.logLevel=INFO", "-Djava.library.path=/opt/mockserver/libtcnative-1.so.0.1.27", "-cp", "/opt/mockserver/mock-0.1-SNAPSHOT.jar:/opt/mockserver/mockserver-netty-jar-with-dependencies.jar:/opt/mockserver/tomcat-native-1.1.27.jar", "org.mockserver.cli.Main", "-serverPort", "1080", "-proxyPort", "1090"]
