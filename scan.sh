#!/bin/bash

with_vulnerabilities="$3"

if [[ "$with_vulnerabilities" == "true" ]]; then
  echo "Scanning with vulners script ..."
  nmap -sV --script vulners --script-args mincvss=5.0 -oA "/data/$1" "$2"
else
  echo "Scanning without vulners script ..."
  nmap -sT -oA "/data/$1" "$2"
fi

# Convert XML to HTML report
xsltproc -o "/data/$1.html" /tmp/nmap-bootstrap.xsl "/data/$1.xml"