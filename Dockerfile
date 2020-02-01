FROM jboss/wildfly:18.0.1.Final

USER root
# dependancies
RUN yum install -y wget

# install wkhtmltopdf
RUN \
    wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox-0.12.5-1.centos7.x86_64.rpm && \
    yum -y install wkhtmltox-0.12.5-1.centos7.x86_64.rpm

USER jboss
