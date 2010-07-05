dataSource {
	pooled = false
	driverClassName = "org.hsqldb.jdbcDriver"
	username = "sa"
	password = ""
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='org.hibernate.cache.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "create-drop" // one of 'create', 'create-drop','update'
			url = "jdbc:hsqldb:mem:devDB"
		}
	}
	test {
		dataSource {
			dbCreate = "create-drop"
			url = "jdbc:hsqldb:mem:testDB"
		}
	}
    build {
		dataSource {
			dbCreate = "update"
			url = "jdbc:hsqldb:mem:buildDb"
		}
	}
	staging {
		dataSource {
			dbCreate = "update"
			url = "jdbc:hsqldb:mem:stagingDb"
		}
	}
    production {
		dataSource {
			dbCreate = "update"
			url = "jdbc:hsqldb:mem:vixtoryDemoDb"
		}
	}
}