#!/bin/bash
ROOTDIR='.'

# 打包
exporters=$(find ${ROOTDIR} -maxdepth 1 -mindepth 1 -type d -name "prometheus-*-exporter" -printf '%f\n')

for exporter in $exporters; do
    if [ $exporter != "prometheus-kafka-exporter" ]; then
   	    go run scripts/gen-alerts/main.go --exporter $exporter
	else
	    continue
	fi
done
