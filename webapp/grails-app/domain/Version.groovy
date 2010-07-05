/**
 * A Version represents a development branch of a Project.
 */
class Version implements Comparable
{
    /** Each Version belongs to one Project */
    static belongsTo = [project: Project]
    
    /** Each Version has many views */
    static hasMany = [views: View]
    
    SortedSet views
    
    /** Version number of this version.*/
    String versionNumber

    /** A description of this version */
    String description

    /** The URL containing the browsable site for this version */
    String url
    
    /** Current project status */
    Iframe iframe
    
    WorkStatus status

    /** A short name for this version.
       *
       * For example, a Newsletter Manager version 3 could have
       * "NL3" as its short name.
       */
    String shortName

    static constraints = {
    	versionNumber(blank:false, nullable:false)
    	description(blank:false)
    	
    	url(url:true,
            validator: { url ->
                try {
                	System.setProperty("http.agent", "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.0.4) Gecko/20060508 Firefox/1.5.0.4")
                    url.toURL().text
                    return true
                }
                
                catch (Exception e) {
                	return ['http.problem',e.getMessage()]
                }
            }
        )
        status(blank:false, nullable:false)
        shortName(blank:false, nullable:false)
        iframe(blank:false, nullable:false)
        
    	
    }
    
    /** Implements Version comparison */
    int compareTo(obj) {
       versionNumber.compareTo(obj.versionNumber)
   }
}
