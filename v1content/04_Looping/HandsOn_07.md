In this hands on, we will perform some simple looping using a list and output it to the page.

**Tags Used**: [\<cfset>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7ffd.html), [\<cfloop>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7fe2.html), [\<cfoutput>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7ff6.html)

1. Open up the `/www/resume.cfm` file in your code editor.
1. First, let's create the list. On line 1, create a `<cfset>` tag called 'mySkills' with the following value: ColdFusion,HTML5,CSS3,MySQL,jQuery. Your code should look similar to this:

        <cfset mySkills = "ColdFusion,HTML5,CSS3,MySQL,JQuery" />

1. Locate the `Skills Listings` comment.
1. Next, loop over the list using a `<cfloop>`. After the opening `<ul>` tag below the comment, on or around line 154, create an opening `<cloop>` tag with the following attributes:
    * **list**: #mySkills#
    * **index**: skill

1. On the next line, write the following line of code:

        <li class="#skill#" id="#skill#">#skill#</li>

1. After this line, create a closing `</cfloop>` tag.
1. Your code should look similar to this:

        <cfloop list="#mySkills#" index="skill">
            <li class="#skill#" id="#skill#">#skill#</li>
        </cfloop>

1. Delete the remaining `<li>` tags.
1. Wrap the `<cfloop>` tag with an opening and closing `<cfoutput>` tag.
1. Your final code should look similar to this:

        <div class="skills">
            <ul>
                <cfoutput>
                    <cfloop list="#mySkills#" index="skill">
                        <li class="#skill#" id="#skill#">#skill#</li>
                    </cfloop>
                </cfoutput>
            </ul>
        </div>

1. Reload `resume.cfm` in your browser and confirm that output under 'My Skillset' is outputting correctly.