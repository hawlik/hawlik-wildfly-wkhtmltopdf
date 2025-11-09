FROM hawlik/wildfly:wf26-j21

USER root

# timezone
RUN unlink /etc/localtime && ln -s /usr/share/zoneinfo/Europe/Warsaw /etc/localtime

RUN apt-get update && apt-get install -y \
    wkhtmltopdf \
    xfonts-75dpi \
    xfonts-base \
 && rm -rf /var/lib/apt/lists/* \

USER jboss

EXPOSE 8080

CMD ["/run.sh"]
