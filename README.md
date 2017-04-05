# Kafka deb file packager

This is a minimal deb file packager for Kafka. It is aimed at Ubuntu 16.04
and uses Systemd as a loader. The `build.sh` script will download Kafka
and deliver a deb file. The Kafka version can be configured in the script.
It places the package in the following directories:

* Distribution: `/usr/share/kafka`
* Binaries: `/usr/share/kafka/bin`
* Configuration: `/usr/share/kafka/config`

Build the scripts using:
```bash
./builder.#!/bin/sh
```

If you want to change the version of Kafka, the following variables are at
your disposal:
```bash
KAFKA_VERSION="0.10.2.0"
SCALA_VERSION="2.12"
```
