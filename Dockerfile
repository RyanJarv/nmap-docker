FROM alpine:latest
ARG nmap_ver=7.91
RUN apk update && \
    apk add --no-cache \
    curl \
    nmap \
    nmap-scripts \
    libxslt
RUN curl -O --output-dir /tmp https://raw.githubusercontent.com/honze-net/nmap-bootstrap-xsl/master/nmap-bootstrap.xsl
RUN cp /tmp/nmap-bootstrap.xsl /usr/share/nmap/nmap.xsl
COPY ./scan.sh /tmp/scan.sh
RUN chmod +x /tmp/scan.sh
VOLUME [ "/data" ]
ENTRYPOINT ["sh", "/tmp/scan.sh"]
CMD ["-sT", "-F", "-Pn", "scanme.nmap.org"]
