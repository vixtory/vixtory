#!/bin/bash
#
# Buildfile that is executed by Bamboo
#
export GRAILS_HOME=/opt/grails-1.1
export GROOVY_HOME=/opt/groovy-1.6.0
export PATH=$PATH:$GROOVY_HOME/bin:$GRAILS_HOME/bin
rm -rf /www/home/bamboo/bamboo-agent-home/xml-data/build-dir/AGILE-TRUNK/test-reports
cp -r /www/home/bamboo/bamboo-agent-home/xml-data/build-dir/AGILE-TRUNK/test/reports /www/home/bamboo/bamboo-agent-home/xml-data/build-dir/AGILE-TRUNK/test-reports
grails clean
grails -Dgrails.env=build war
