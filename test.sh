#!/bin/bash

export OPENSHIFT_JBOSSAS6_DIR=../testrun
export OPENSHIFT_JBOSSAS6_HTTP_PORT=8070
export OPENSHIFT_JBOSSAS6_IP=127.0.0.1
export OPENSHIFT_CARTRIDGE_SDK_BASH=/home/ec2-user/origin-server-master/node/misc/usr/lib/cartridge_sdk/bash/sdk

echo Using $OPENSHIFT_JBOSSAS6_DIR as test dir

echo Wait for shutdown
killall java
sleep 5

rm -rf $OPENSHIFT_JBOSSAS6_DIR
mkdir $OPENSHIFT_JBOSSAS6_DIR

export OPENSHIFT_JBOSSAS6_DIR=$(cd $OPENSHIFT_JBOSSAS6_DIR; pwd)
echo Created $OPENSHIFT_JBOSSAS6_DIR

cp -R . $OPENSHIFT_JBOSSAS6_DIR
cd $OPENSHIFT_JBOSSAS6_DIR
bin/setup
bin/control start
