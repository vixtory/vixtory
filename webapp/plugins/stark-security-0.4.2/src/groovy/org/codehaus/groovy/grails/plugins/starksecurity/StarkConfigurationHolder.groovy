package org.codehaus.groovy.grails.plugins.starksecurity

import grails.util.GrailsUtil
import groovy.util.ConfigObject
import org.apache.commons.logging.LogFactory

class StarkConfigurationHolder {
    
    static log = LogFactory.getLog("org.codehaus.groovy.grails.plugins.starksecurity.StarkConfigurationHolder")

    private static ConfigObject configObject
    
    static private readConfig() {
        configObject = null
        Class theClass
    	GroovyClassLoader classLoader = new GroovyClassLoader(StarkConfigurationHolder.classLoader)
        try {
        	theClass = classLoader.loadClass('StarkSecurityConfig')
        } catch (ClassNotFoundException ex) {
            log.warn "StarkSecurityConfig.groovy not found.  No authentication managers will be created."
        }
        if (theClass) {
            configObject = new ConfigSlurper(GrailsUtil.environment).parse(theClass)
            log.debug "configObject is now ${configObject}"
        }
    }
    
    static ConfigObject getConfig() {
        if (!configObject) {
            readConfig()
        }
        return configObject
    }
    
    static void setConfig(ConfigObject newValue) {
        configObject = newValue
    }
    
}