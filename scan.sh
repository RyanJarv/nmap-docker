#!/bin/bash

OUTFILE="/data/$1"
shift

echo "Running: nmap -oA $OUTFILE $@"
nmap -oA "$OUTFILE" "$@"

# Convert XML to HTML report
xsltproc -o "${OUTFILE}.html" /tmp/nmap-bootstrap.xsl "${OUTFILE}.xml"
