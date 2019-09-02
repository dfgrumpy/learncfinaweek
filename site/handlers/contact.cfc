/**
* I am a new handler
*/
component{
	

	property name="jsonDataService" inject="jsonDataService";

	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};




	function preHandler( event, rc, prc, action, eventArguments ){
		prc.contributors = jsonDataService.contributorsList();
	}




	function index( event, rc, prc ){


	}
	
}
