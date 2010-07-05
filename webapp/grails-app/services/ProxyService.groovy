

/* 
 * Very Simple proxy service
 * Service is scoped for session,
 * each user get their own instance of service with httpclient
 * @author Jle
 */

import org.apache.commons.httpclient.*
import org.apache.commons.httpclient.methods.*
import org.apache.commons.httpclient.params.HttpMethodParams
import org.apache.commons.httpclient.cookie.CookiePolicy
import org.apache.commons.httpclient.cookie.CookieSpec
import org.apache.commons.httpclient.protocol.*
import org.springframework.beans.factory.InitializingBean
class ProxyService implements InitializingBean{

    boolean transactional = false
    static scope = "session"
    
    def client

    

    /**
     *Proxy loading function
     *params=request parameter map
     *ctx=current context root
     *rtype=request type (post / get)
     **/

    def getUrl(params,ctx,rtype){
    
    	def url=params.url
    	def statusCode
    	def method
 
    	println ("context ${ctx}");
    	println ("url to load ${url}");
    
        try{
            if (rtype.equals("get")){

                if(url.contains("?")){
                    //fix dynamic url with multiple parameters
                    params.each{
                        if (!it.key.equals("url")&&!it.key.equals("action")&&!it.key.equals("controller"))  {
                            url = "${url}&${it.key}=${it.value}"
                        }
                    }
                }
                url=url.replace("\\","/")

                method = new GetMethod(url)
            }
            else{
                method = new PostMethod(url)
                params.each{method.addParameter(it.key,it.value)}
                method.removeParameter("url")
            }

            println ("url to load ${url}");
    		
            statusCode = client.executeMethod(method);
            byte[] responseBody = method.getResponseBody();
            def html=new String(method.getResponseBodyAsString());
            println statusCode;
            
            // ! one line magic string !, added support for redirection
            html="<base href='${method.getURI()}'>$html"

            //inject javascript function to rewrite links & forms & call parent with current url
            html = "$html<script src='${ctx}/js/rewrite.js'></script>"
            html = "$html<script>rewrite('${ctx}/proxy/load?url=')</script>"
            html = "$html<script>rewriteforms('${ctx}/proxy/post?url=')</script>"
            html = "$html<script>callparent('${url}')</script>"
            return html

        }
       
        catch (Exception e){
            return "proxy couldn't load ${url} ( ${e.getMessage()} - ${statusCode} ) "
        }
    }
    
    //constructor, initialize httpclient
    void afterPropertiesSet()
    {
        this.client = new HttpClient();
    }
    
}
