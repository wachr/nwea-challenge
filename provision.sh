#! /bin/sh

# provision.sh
# author: Ray Wach
# date: 2015-03-12

set -e

# Enable the Puppet repository
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

# Install puppet
yum install -y puppet
