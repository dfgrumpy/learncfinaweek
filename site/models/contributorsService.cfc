/**
* I am a new Model Object
*/
component accessors="true" {
	
    property name="jsonDataService" inject="jsonDataService";
	// Properties
	

	/**
	 * Constructor
	 */
	contributorsService function init(){
		
		return this;
	}
	

	function getContributorById(required contributorid) {

		var contributors = jsonDataService.contributorsList().authors;

		var s = structNew();
		s.myArray = contributors;
		match = structFindValue(s, contributorid, "all");

		return isArray(match)? match[1].owner: [];

	}

		

}