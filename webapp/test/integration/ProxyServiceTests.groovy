//proxyn testit

class ProxyServiceTests extends GroovyTestCase {

    def proxyService = new ProxyService()
    def charsets = []

    
    void testInvalidUrl() {
        def params = [url:"http://very.invalid.url"]
        def request = "get"
        def response = proxyService.getUrl(params,"http://www.jotain.com",request)
        assertTrue(response.contains("proxy couldn't load"))
    }

    void testLoadCommonUrl() {
        def params = [url:"http://www.uta.fi"]
        def request = "get"
        def response = proxyService.getUrl(params,"http://localhost:8080/vixtory",request)
        assertTrue(response.contains("<base href='${params.url}/'>"))
    }

    //testing redirection
    //google.com redirects to google.fi
    void testLoadRedirectedUrl() {
        def params = [url:"http://www.google.com"]
        def request = "get"
        def response = proxyService.getUrl(params,"http://localhost:8080/vixtory",request)
        assertTrue(response.contains("<base href='http://www.google.fi/'>"))
    }




}
