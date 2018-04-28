FROM tomcat:8.5
ENV TZ=Asia/Shanghai JAVA_OPTS="$JAVA_OPTS -Des.set.netty.runtime.available.processors=false -Xms256m -Xmx256m -XX:PermSize=32m -XX:MaxPermSize=64m -Djava.security.egd=file:/dev/./urandom"
COPY sources.list /etc/apt/sources.list
RUN apt-get -y update \
	&& apt-get install -y vim less \
	&& mkdir /data \
        && mkdir -p $CATALINA_HOME/conf/Catalina/localhost \
        && rm -rf $CATALINA_HOME/webapps/ROOT \
        && echo "<?xml version='1.0' encoding='utf-8'?>\n<Context path=\"\" docBase=\"/data/webapps/app.war\" privileged=\"true\" reloadable=\"false\"/>" > $CATALINA_HOME/conf/Catalina/localhost/ROOT.xml
COPY start.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/start.sh"]
RUN chmod +x /usr/local/bin/start.sh
