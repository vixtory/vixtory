/**
 * A project that Vixtory is used to maintain requirements for.
 */
class Project
{
    /** Map one Project to many Versions. */
    /** Map one Project to several managers */
    static hasMany = [
            versions: Version,
            managers: User
    ]
    
    /** Sorted set of project versions*/
    SortedSet versions

    /** Name of the project */
    String name

    /** A short description of the project */
    String description

    /** Current project status */
    WorkStatus status = WorkStatus.IN_PROGRESS

    /** A project has one or more managers */
    //Map managers = [:]
    
    static constraints = {
    	name(blank:false, unique:true)
    	description(blank:false)
    	status(blank:false, nullable:false)
        managers(nullable: false, minSize:1)
    }
}