#!/bin/bash

KAFKA_VERSION="0.10.2.0"
SCALA_VERSION="2.12"
URL="http://apache.mirrors.tds.net/kafka"
TARBALL="kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz"
DEB_NAME="kafka_${KAFKA_VERSION}_all"

# Grab the tarball if we don't already have it
[ ! -f ${TARBALL} ] && wget -nv "${URL}/${KAFKA_VERSION}/${TARBALL}"

# Untar this in a clean /usr/share/kafka directory
[ ! -f deb/usr/share/kafka ] && mkdir -p deb/usr/share/kafka
rm -rf deb/usr/share/kafka/*
tar xf ${TARBALL} --strip-components=1 -C deb/usr/share/kafka

# I like config files in /etc so lets move them there
# rm -f deb/etc/kafka/*
# mv deb/usr/share/kafka/config/* deb/etc/kafka/
# rm -rf deb/usr/share/kafka/config

# Clean up stuff we don't need i the distro
rm -rf deb/usr/share/kafka/bin/windows
rm -rf deb/usr/share/kafka/site-docs
ln -s deb ${DEB_NAME}

# Create package
dpkg-deb --build ${DEB_NAME}
rm ${DEB_NAME}

# copy deb file to my lxd container
#sudo cp kafka_0.10.2.0_all.deb /var/lib/lxd/containers/kafka/rootfs/root/
