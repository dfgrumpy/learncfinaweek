/**
* I am a new handler
*/
component{

	property name="jsonDataService" inject="jsonDataService";
	property name="contributorsService" inject="contributorsService";
	property name="courseService" inject="courseService";

	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};

	function index( event, rc, prc ){

		//event.setlayout('course');

		// week is hardcoded for now
		prc.thisSection = courseService.courseData(rc, 1);
		prc.thisSection["authorData"] = contributorsService.getContributorById(prc.thisSection.authorid);

	}


	function preHandler( event, action, eventArguments, rc, prc ){
		// week is hardcoded for now
		prc.menudata = jsonDataService.jasonForWeek(1).menu;
		prc.section = structKeyExists( rc, 'section' ) ? rc.section : 'Setup';
		prc.item = structKeyExists( rc, 'section' ) && structKeyExists( rc, 'item' )
			? rc.item : 'Installing_ColdFusion';

	}




}
