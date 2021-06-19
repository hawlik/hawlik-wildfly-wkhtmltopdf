FROM jboss/wildfly:18.0.1.Final

USER root

# timezone
RUN unlink /etc/localtime && ln -s /usr/share/zoneinfo/Europe/Warsaw /etc/localtime

#install wget
RUN yum install -y wget

# install wkhtmltopdf
RUN \
    wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox-0.12.6-1.centos7.x86_64.rpm && \
    yum -y install wkhtmltox-0.12.5-1.centos7.x86_64.rpm

USER jboss

EXPOSE 8080

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
