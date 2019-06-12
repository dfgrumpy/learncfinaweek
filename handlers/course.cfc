/**
* I am a new handler
*/
component{

	property name="cbmarkdown" inject="Processor@cbmarkdown";

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
		writeOutput( "<br><br><br>");
		writeDump( var=rc, expand=false, label='rc' );
		writeDump( var=prc, expand=false, label='prc' );
	}


	function preHandler( event, action, eventArguments, rc, prc ){

		prc.menudata = deserializejson( fileread( '#expandpath( "." )#/data/week1.json' ) ).menu;
		prc.section = structKeyExists( rc, 'section' ) ? rc.section : 'Setup';
		prc.item = structKeyExists( rc, 'section' ) && structKeyExists( rc, 'item' )
			? rc.item : 'Installing_ColdFusion';
		var sectionIndex = arrayFind( prc.menudata, function( item ) {
			return replace( item.name,' ', '_', 'all' ) == prc.section;
		});
		prc.thisSection = prc.menudata[ sectionIndex ];
		var itemIndex = arrayFind( prc.thisSection.sections, function( item ) {
			return replace( replace( item.name, "?", "", "all") ," ", "_", "all") == prc.item;
		});
		prc.thisSection[ 'itemName' ] = prc.thisSection.sections[ itemIndex ].name;
		prc.thisSection[ 'itemFileName' ] = prc.thisSection.sections[ itemIndex ].filename;
		var chapterPath = '/data/week1/' & prc.thisSection.itemFileName;
		var chapterMarkdown = fileread( expandpath( chapterPath ) );
		prc.thisSection[ 'content' ] = cbmarkdown.toHTML( chapterMarkdown );
	}



}
