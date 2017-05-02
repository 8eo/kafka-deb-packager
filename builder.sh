#!/bin/bash

MINOR_VER="2"
KAFKA_VERSION="0.10.2.1"
DEB_VERSION="${KAFKA_VERSION}-${MINOR_VER}"
SCALA_VERSION="2.12"
URL="http://apache.mirrors.tds.net/kafka"
TARBALL="kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz"
DEB_NAME="kafka_${DEB_VERSION}_all"

# Grab the tarball if we don't already have it
[ ! -f ${TARBALL} ] && wget -nv "${URL}/${KAFKA_VERSION}/${TARBALL}"

# Untar this in a clean /usr/share/kafka directory
[ ! -f deb/usr/share/kafka ] && mkdir -p deb/usr/share/kafka
rm -rf deb/usr/share/kafka/*
tar xf ${TARBALL} --strip-components=1 -C deb/usr/share/kafka

# Clean up stuff we don't need in the distro
rm -rf deb/usr/share/kafka/bin/windows
rm -rf deb/usr/share/kafka/site-docs
ln -s deb ${DEB_NAME}

# Inject the version into the deb control file
cat control  | sed "s/^Version:.*/Version: ${DEB_VERSION}/" > deb/DEBIAN/control

# Create package
dpkg-deb --build ${DEB_NAME}
rm ${DEB_NAME}
rm deb/DEBIAN/control
