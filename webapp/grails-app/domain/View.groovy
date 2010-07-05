class View implements Comparable
{
	/** Each View belongs to one Version */
    static belongsTo = [version: Version]
	
    /** Each view has many requirements */
    static hasMany = [requirements: Requirement]

    /** The URL of this view */
    String url
    
    /** Date the view was created */
    Date creationDate
    
    /** Implements View comparison */
    int compareTo(obj) {
       creationDate.compareTo(obj.creationDate)
   }
}