In this hands on, let's create a function that will take a string and output a string of ASCII characters. Some people think that this will stop email addresses from being spidered. This may or may not be the case, but the logic for creating a function is still the same.

**Tags Used**: [\<cfscript>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7ebf.html), [\<cffunction>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7f5c.html), [\<cfargument>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7e47.html), [\<cfset>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7ffd.html), [\<cfloop>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7fe2.html), [\<cfreturn>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7df7.html)

**Functions Used**: [asc](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-6e26.html), [mid](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7b56.html)

1. Open up the `/www/about.cfm` file in your code editor.
1. Below the closing `</cfscript>` tag, create a `<cffunction>` tag with the following attributes:
    * **name**: convertStringToASCII
    * **output**: false
    * **returntype**: string
    * **hint**: Converts String to ASCII String
1. Directly after the open `<cffunction>` tag, create a `<cfargument>` tag with the following attributes:
    * **name**: stringToBeConverted
    * **type**: string
    * **required**: true
1. Your code should look similar to this:

        <cffunction name="convertStringToASCII" output="false" returntype="String" hint="Converts string to asccii string" >
            <cfargument name="stringToBeConverted" type="string" required="true" />

1. After the `<cfargument>` tag, create a `<cfset>` that sets an empty string to a variable called `convertedString`.
1. Before the variable name in the `<cfset>` tag, enter the word `Var`. This will scope the variable to the scope that is local to the function and will not interfere with any other variables on the page.
1. Your code should look similar to this:

        <cfset var convertedString = '' />

1. After the `<cfset>` tag, create a `<cfloop>` tag with the following attributes:
    * **from**: 1
    * **to**: #len(arguments.stringToBeConverted)#
    * **index**: i
1. After the opening `<cfloop>` tag, create a `<cfset>`. This `<cfset>` tag will use string concatenation and should look similar to this:

        <cfset convertedString &= '&##' & asc(mid(arguments.StringTobeConverted,i,1)) & ';' />

1. After the `<cfset>` tag, create a closing `</cfloop>` tag.
1. Below the closing </cfloop> tag, create a <cfreturn> tag that returns the convertedString variable.
1. Below the `<cfreturn>` tag, create a closing `</cffunction>` tag.
1. Your function should look similar to this:

        <cffunction name="convertStringToASCII" output="false" returntype="String" hint="Converts string to asccii string" >
            <cfargument name="stringToBeConverted" type="string" required="true" />
            <cfset var convertedString = '' />

            <cfloop from="1" to="#len(arguments.StringToBeConverted)#" index="i">
                <cfset convertedString &= '&##' & asc(mid(arguments.StringTobeConverted,i,1)) & ';' />
            </cfloop>

            <cfreturn convertedString />
        </cffunction>

1. Locate the `personalInfo.email` output which should be on or around line 129.
1. Wrap the `personalInfo.email` output with a call to the `convertStringToASCII` function call. Your code should look similar to this:

        #convertStringToASCII(personalInfo.email)#

1. Browse to the `/www/about.cfm` page in your browser.
1. You should see no change to your page.
1. View the source of the page and locate where the email address is being output. You should no longer see the email address but a stream of ASCII characters.