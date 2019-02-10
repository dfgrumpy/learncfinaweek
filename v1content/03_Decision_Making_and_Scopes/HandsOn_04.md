In this hands on, you are going to validate the form data that was submitted and output any problems that might have occurred. We will access data from the form scope.

**Tags Used**: [\<cfset>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7ffd.html), [\<cfif>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7fe8.html)

**Functions Used**: [len](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7f38.html)

1. Locate the comment that says `Message Output` in the `/www/contact.cfm` file and remove all the code that is inside the `<cfif>` tag just below it.
1. Inside the `<cfif>` tag create a variable called `OK` and set it to true.
1. Below the `<cfset>`, create a `<cfif>` statement that checks if the length of the value of `form.contactname` is equal to 0. To do that, use a function called `len()` which will return the number of characters in the provided string. Your code should look similar to this:

        <cfset ok = true />

        <cfif len(form.contactname) eq 0>

        </cfif>

1. Inside the `<cfif>` statement, set the `OK` variable to false.
1. You should end up with code similar to this:

        <cfset ok = true />

        <cfif len(form.contactname) eq 0>
            <cfset ok = false />
        </cfif>

1. Create `<cfif>` statements for the email and message fields in the form.
1. After the last `<cfif>` statement, create a new `<cfif>` statement that checks if the `OK` value is equal to false. If it is equal to false, output the following:

        <p>You did not provide all the required information!</p>

1. Your final block of code should look similar to this:

        <cfif form.submitted>
            <cfset ok = true />

            <cfif len(form.contactname) eq 0>
                <cfset ok = false />
            </cfif>

            <cfif len(form.email) eq 0>
                <cfset ok = false />
            </cfif>

            <cfif len(form.message) eq 0>
                <cfset ok = false />
            </cfif>

            <cfif ok eq false>
                <p>You did not provide all the required information!</p>
            </cfif>
        </cfif>

1. Reload the `contact.cfm` page in your browser and click 'submit'. You should see the message "You did not provide all the required information!" displayed.
1. Fill in all the fields in the form and click 'submit'. You will notice that the message does not display.