FROM oscm-gf

RUN mkdir /opt/apache-tomee/apps && \
 mkdir /opt/apache-tomee/controllers && \
 mkdir /opt/properties && \
 mkdir /opt/sso && \
 mkdir /opt/certs && \
 mkdir /opt/key

ENV AUTH_MODE=INTERNAL KEY_SECRET=secretsecret1234 DOMAIN_PWD=adminadmin CERT_FILE=s1as.crt IDP_WSDL_URL=dummy IDP_TARGET_NAMESPACE=dummy
ENV DB_HOST_APP=oscm-db DB_PORT_APP=5432 DB_NAME_APP=bssapp DB_USER_APP=bssappuser DB_PWD_APP=bssappuser
ENV DB_TIMEOUT_APP=300 DB_WAIT_APP=60000 DB_RETRY_INTERVAL_APP=10
ENV SMTP_HOST=localhost SMTP_PORT=25 SMTP_FROM=mail@oscm.org SMTP_USER=saas SMTP_AUTH=false SMTP_PWD=secret SMTP_TLS_ENABLE=false

COPY resources/server.xml /opt/apache-tomee/conf/
COPY resources/system.properties /opt/apache-tomee/conf/
COPY resources/tomcat-users.xml /opt/apache-tomee/conf/
COPY resources/tomee_template.xml /opt/apache-tomee/conf/
COPY resources/key /opt/apache-tomee/bin/
COPY resources/catalina.properties /opt/apache-tomee/conf/catalina.properties
COPY resources/context.xml /opt/apache-tomee/conf/context.xml

COPY oscm-app.ear /opt/apache-tomee/apps/
COPY oscm-app-aws.ear oscm-app-openstack.ear /opt/apache-tomee/controllers/

COPY postgresql-9.4-1206-jdbc42.jar /opt/apache-tomee/lib/postgresql-9.4-1206-jdbc42.jar
COPY oscm-app-extsvc-2-0.jar /opt/apache-tomee/lib/oscm-app-extsvc-2-0.jar
COPY log4j-1.2.16.jar /opt/apache-tomee/lib/log4j-1.2.16.jar

COPY ssl.key ssl.crt /opt/
COPY ssl.crt /import/certs/
COPY ssl.crt /usr/share/pki/trust/anchors

COPY start.sh /opt/
RUN chmod +x /opt/start.sh

CMD ["/opt/start.sh"]
