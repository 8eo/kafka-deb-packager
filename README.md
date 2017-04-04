# Kafka deb file packager

This is a minimal deb file packager for Kafka. It is aimed at Ubuntu 16.04
and uses Systemd as a loader. The `build.sh` script will download Kafka
and deliver a deb file. The Kafka version can be configured in the script.
It places the package in the following directories:

* Distribution: `/usr/share/kafka`
* Binaries: `/usr/share/kafka/bin`
* Configuration: `/etc/kafka/`
