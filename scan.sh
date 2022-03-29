#!/bin/bash

OUTDIR="/data"
echo "Running: nmap -oA $OUTDIR/$1 $@"
nmap -oA "$OUTDIR/$1" "$@"

# Convert XML to HTML report
xsltproc -o "$OUTDIR/$1.html" /tmp/nmap-bootstrap.xsl "$OUTDIR/$1.xml"
