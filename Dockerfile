FROM alpine:latest
ARG nmap_ver=7.91
LABEL org.opencontainers.image.source="https://github.com/MTES-MCT/nmap-docker"
LABEL org.opencontainers.image.vendor="Tristan Robert"
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
CMD ["nmap-scanme", "scanme.nmap.org", "true"]