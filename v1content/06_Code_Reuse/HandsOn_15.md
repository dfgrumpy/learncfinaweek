In this hands on, let's create a component where we will place the `convertStringToASCII` function inside of a component and instantiate it.

**Tags Used**: [\<cfcomponent>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7e0e.html), [\<cffunction>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7f5c.html)

**Functions Used**: [createObject](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7ec2.html)

1. Create a folder called `cfc` inside the `/www/` folder.
1. Create a file called `utilities.cfc` inside of the `/www/cfc/ `folder.
1. Open up the `/www/cfc/utilities.cfc` file in your code editor.
1. Create an open and closing `<cfcomponent>` tag. Your code should look something like this:

        <cfcomponent>

        </cfcomponent>

1. Open up the `/www/about.cfm` file in your code editor.
1. Copy the `<cffunction>` block of code and paste it between the `<cfcomponent>` tags in `/www/cfc/utilities.cfc`.
1. Inside the `<cffunction>` tag, add an attribute called `access` and set it to "public".
1. Your code should look similar to this:

        <cfcomponent>
            <cffunction name="convertStringToASCII" output="false" returntype="String" hint="Converts string to asccii string" access="public">
                <cfargument name="stringToBeConverted" type="string" required="true" />
                <cfset var convertedString = '' />

                <cfloop from="1" to="#len(arguments.StringToBeConverted)#" index="i">
                    <cfset convertedString &= '&##' & asc(mid(arguments.StringTobeConverted,i,1)) & ';' />
                </cfloop>

                <cfreturn convertedString />
            </cffunction>
        </cfcomponent>

1. In `/www/about.cfm`, replace the `<cffunction>` tag block with a `<cfset>` tag. The `<cfset>` tag should set a variable called `utilities` and should instantiate the utilities component by using the following code:

        <cfset utilities = CreateObject('cfc.utilities') />

1. Locate the call to the `convertStringToASCII` function, which should be on or around line 58, and change the function call to `utilities.convertStringToASCII`. The line of code should look similar to this:

        #utilities.convertStringToASCII(personalInfo.email)#

1. Go to the `/www/about.cfm` page in your browser and notice that the email address displays as it did before. The `convertStringToASCII` function is now in a cfc that can be instantiated from any page.

Homework
--------

Convert the email address in the file /www/contact.cfm to use the convertStringToASCII function.