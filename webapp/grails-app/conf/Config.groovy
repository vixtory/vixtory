// locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

if (System.properties["${appName}.config.location"]) {
    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
}
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true

// log4j configuration
log4j {
    appender.stdout = "org.apache.log4j.ConsoleAppender"
	appender.'stdout.layout'="org.apache.log4j.PatternLayout"
 	appender.'stdout.layout.ConversionPattern'='[%r] %c{2} %m%n'
    rootLogger="error,stdout"
    logger {
        grails="error,stdout"
        org {
            codehaus.groovy.grails.web.servlet="error,stdout"  //  controllers
            codehaus.groovy.grails.web.errors="error,stdout"  //  web layer errors            
			codehaus.groovy.grails.web.pages="error,stdout" //  GSP
        	codehaus.groovy.grails.web.sitemesh="error,stdout" //  layouts
        	codehaus.groovy.grails."web.mapping.filter"="error,stdout" // URL mapping
        	codehaus.groovy.grails."web.mapping"="error,stdout" // URL mapping
            codehaus.groovy.grails.commons="info,stdout" // core / classloading
            codehaus.groovy.grails.plugins="error,stdout" // plugins
            codehaus.groovy.grails.orm.hibernate="error,stdout" // hibernate integration
            springframework="off,stdout"
            hibernate="off,stdout"
        }
    }
	additivity.'default' = false
    additivity {
		grails=false
		org {
           codehaus.groovy.grails=false
           springframework=false
		   hibernate=false
		}
    }
}

// Set environment-specific logging options (mikea)
// Commented out because it fails the ant war -task (anttij)
/*
environments {
    development {
        log4j {
            logger {
                grails="debug,stdout"
            }
        }
    }
    production {
        log4j {
            logger {
                grails.'app.controller.ProxyController'="debug,stdout"
                grails.app="error,stdout"
            }
        }
    }
}
*/

// The following properties have been added by the Upgrade process...
grails.views.default.codec="none" // none, html, base64
grails.views.gsp.encoding="UTF-8"

//log4j.logger.org.springframework.security="off,stdout"

/*
 * Environment spesific Vixtory properties
 */

environments {
    development {
    	grails.serverURL = "http://localhost:8080"
    }
    build {
    }
    staging {
    }
    production {
    	grails.serverURL = "http://demo.vixtory.com"
    }
}