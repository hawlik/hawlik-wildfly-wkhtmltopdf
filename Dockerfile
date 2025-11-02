FROM quay.io/wildfly/wildfly:38.0.0.Final-jdk21

USER root

# timezone
#RUN unlink /etc/localtime && ln -s /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
#RUN microdnf install -y yum
#install wget
RUN (microdnf -y update || true) && \
    (microdnf -y install wget ca-certificates || dnf -y install wget ca-certificates) && \
    (microdnf clean all || dnf clean all)
#RUN apt -y install xorg-x11-fonts-75dpi

# install wkhtmltopdf
RUN \
    wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.jammy_amd64.deb && \
    apt -y install ./wkhtmltox_0.12.6.1-2.jammy_amd64.deb

USER jboss

EXPOSE 8080

CMD ["/run.sh"]
