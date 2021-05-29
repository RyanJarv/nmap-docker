#!/bin/bash

with_vulnerabilities="$3"
OUTDIR="/data"
if [[ "$with_vulnerabilities" == "true" ]]; then
  echo "Scanning with vulners script ..."
  nmap -sV --script vulners --script-args mincvss=5.0 -oA "$OUTDIR/$1" "$2"
else
  echo "Scanning without vulners script ..."
  nmap -sT -oA "$OUTDIR/$1" "$2"
fi

# Convert XML to HTML report
xsltproc -o "$OUTDIR/$1.html" /tmp/nmap-bootstrap.xsl "$OUTDIR/$1.xml"
