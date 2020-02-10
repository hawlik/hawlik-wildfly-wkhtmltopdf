FROM jboss/wildfly:18.0.1.Final

USER root
# dependancies

RUN echo "Europe/Warsaw" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN yum install -y wget

# install wkhtmltopdf
RUN \
    wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox-0.12.5-1.centos7.x86_64.rpm && \
    yum -y install wkhtmltox-0.12.5-1.centos7.x86_64.rpm

USER jboss

EXPOSE 8080

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
