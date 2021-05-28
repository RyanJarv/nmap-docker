FROM alpine:latest
ARG nmap_ver=7.91
LABEL org.opencontainers.image.source="https://github.com/MTES-MCT/nmap-docker"
LABEL maintainer="Tristan Robert"
RUN apk update && \
    apk add --no-cache \
    nmap \
    nmap-scripts \
    libxslt
ADD https://raw.githubusercontent.com/honze-net/nmap-bootstrap-xsl/master/nmap-bootstrap.xsl /tmp/
RUN cp /tmp/nmap-bootstrap.xsl /usr/share/nmap/nmap.xsl
COPY ./scan.sh /tmp/scan.sh
RUN chmod +x /tmp/scan.sh
VOLUME [ "/data" ]
ENTRYPOINT ["sh", "/tmp/scan.sh"]
CMD ["nmap-scanme", "scanme.nmap.org", "true"]