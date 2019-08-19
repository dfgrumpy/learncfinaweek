/**
* I am a new Model Object
*/
component accessors="true" singleton {
	
	// Properties	

	function init(){
		

		variables.week[1] = deserializejson( fileread( '#expandpath( "." )#/data/week1.json' ) ); 
		variables.chapterPath[1] = '/data/week1/';
		variables.contributors = deserializejson( fileread( '#expandpath( "." )#/data/contributors.json' ) );

		return this;
	}
	

 	function jasonForWeek(required week) {

 		return variables.week[arguments.week];

 	}

 	function chapterPathForWeek(required week) {

 		return variables.chapterPath[arguments.week];

 	}

 	function contributorsList() {

 		return variables.contributors;

 	}


}