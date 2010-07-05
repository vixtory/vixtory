// Place your Spring DSL code here
beans = {

     proxyService(ProxyService)

    proxyScopeProxy(org.springframework.aop.scope.ScopedProxyFactoryBean){
        targetBeanName="proxyService"
        proxyTargetClass=true
    }

}