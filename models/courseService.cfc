/**
* I am a new Model Object
*/
component accessors="true"{
	
	// Properties
	
	property name="cbmarkdown" inject="Processor@cbmarkdown";	
    property name="jsonDataService" inject="jsonDataService";


	/**
	 * Constructor
	 */
	courseService function init(){
		
		return this;
	}
	

	function courseData(required data, required week) {

		var thismenudata = jsonDataService.jasonForWeek(arguments.week).menu;
		var thisrc = arguments.data;
		var thisData = {};


		thisData.section = structKeyExists( thisrc, 'section' ) ? thisrc.section : 'Setup';
		thisData.item = structKeyExists( thisrc, 'section' ) && structKeyExists( thisrc, 'item' )
			? thisrc.item : 'Installing_ColdFusion';

		var sectionIndex = arrayFind( thismenudata, function( item ) {
			return replace( item.name,' ', '_', 'all' ) == thisData.section;
		});

		thisData.thisSection = thismenudata[ sectionIndex ];

		var itemIndex = arrayFind( thisData.thisSection.sections, function( item ) {
			return replace( replace( item.name, "?", "", "all") ," ", "_", "all") == thisData.item;
		});

		thisData.thisSection[ 'itemName' ] = thisData.thisSection.sections[ itemIndex ].name;
		thisData.thisSection[ 'itemFileName' ] = thisData.thisSection.sections[ itemIndex ].filename;

		var chapterPath = jsonDataService.chapterPathForWeek(1) & thisData.thisSection.itemFileName;

		if ( fileExists( expandpath( chapterPath ) ) ){
			var chapterMarkdown = fileread( expandpath( chapterPath ) );
			thisData.thisSection[ 'content' ] = cbmarkdown.toHTML( chapterMarkdown );
		} else {
			thisData.thisSection[ 'content' ] = '<p>Content not yet available</p>';
		}
		thisData.thisSection[ 'revised' ] = false;
		if (thisData.thisSection.reviewer.len() && thisData.thisSection.reviewer NEQ thisData.thisSection.author ){
			thisData.thisSection[ 'revised' ] = true;
		}


		return thisData.thisSection;
	}



}