FROM hawlik/wildfly:latest

USER root

# timezone
RUN unlink /etc/localtime && ln -s /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
RUN microdnf install -y yum
#install wget
RUN yum install -y wget

# install wkhtmltopdf
RUN \
    wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox-0.12.6-1.centos8.x86_64.rpm && \
    yum -y install wkhtmltox-0.12.6-1.centos8.x86_64.rpm

USER wildfly

EXPOSE 8080

CMD ["run.sh"]
