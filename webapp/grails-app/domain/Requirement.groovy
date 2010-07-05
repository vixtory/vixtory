/**
 * A requirement attached to a view.
 */
class Requirement 
{
	/** Each Version belongs to one Project */
    static belongsTo = [view:View]

	/** Current title of the requirement -petrik */
    String title

	/** Current status of the requirement  */
    RequirementStatus status

    /** Description of the requirement */
    String description

    /** User who created the requirement */
    String creator

    /** Date the requirement was created */
    Date creationDate

    /** Date the requirement was last edited */
    Date editDate

    /** Priority of the requirement */
    //String priority

    /** Priority of the requirement as a number*/
    //int priorityNumber

    RequirementPriority priority

    /** Requirement coordinates x,y */
    String coordinates

    static constraints = {
        creator(blank: false)
        description(blank:false)
    	title(blank:false)
    }
}