In this hands on, we are going to add security to the blog comments. As this section allows users to supply data that will be stored in a database and will also be output to other users, this is a weakest point of the application.

**Tags Used**: [\<cfif>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7fe8.html), [\<cfset>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7ffd.html), [\<cfthrow>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7e25.html)

**Functions Used**: [isSimpleValue](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7fa8.html), [canonicalize](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WS932f2e4c7c04df8f-1a0d37871353e31b968-8000.html), [CSRFGenerateToken](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WS932f2e4c7c04df8f-1a0d37871353e31b968-7fff.html), [CSRFverifyToken](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WS932f2e4c7c04df8f-1a0d37871353e31b968-7ffe.html), [encodeForHTML](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WS932f2e4c7c04df8f-6f7941141353e2963af-7fff.html)

1. Open up the `/www/blogpost.cfm` file in your code editor.
1. The first thing we are going to do is add some checks to make sure the values in the form are all simple values. Locate the `<cfif>` statement that checks if the `form` has been submitted on or around line 3.
1. Inside the `<cfif>`, prior to creating a new `blogcomment` entity, create a new `if` statement that checks if the `form.author` variable is a simple value. Your code should look similar to this:

        <cfif isSimpleValue(form.author)>

        </cfif>

1. Once we know the value is a simple value, we need to call the `canonicalize()` method on the `form.author` value. To make things easier, assign the result of the `canonicalize()` call back to the `form.author` variable. The code will look similar to this:

        <cfset form.author = canonicalize(form.author, true, true) />

1. Do the same for the remaining `comment` variable. Your final code should look similar to this:

        <cfif isSimpleValue(form.author)>
            <cfset form.author = canonicalize(form.author, true, true) />
        </cfif>
        <cfif isSimpleValue(form.comment)>
            <cfset form.comment = canonicalize(form.comment, true, true) />
        </cfif>

1. Next, check if any of the values were not simple values. If one was not a simple value, it will throw an error. Create a `<cfif>` statement that checks if either are not simple values, and if one isn't, throw an error with the message `Validation Error`. Your code should look similar to this:

        <cfif !isSimpleValue(form.author) || !isSimpleValue(form.comment)>
            <cfthrow message="Validation Error" >
        </cfif>

1. Next, we will utilize ColdFusion's CSRF support by generating and validating a CSRF token. Locate the hidden field in the comment form on or around line 99.
1. Create a new hidden field called `token`, and give it the value:

        #CSRFGenerateToken()#

1. Go to the top of the page and create a new `<cfparam>` tag for the `form.token` variable and default it to empty.
1. Go back to the `<cfif>` statement on or around line 11 which checks if any of the `form` fields is not a simple value.
1. Inside the `<cfif>` tag, check if the token value passed is a valid CSRF token. If the token is not valid, the same error will be thrown by the validation. Your final code should look similar to this:

        <cfif !isSimpleValue(form.author) || !isSimpleValue(form.comment) || !CSRFVerifyToken(form.token)>
            <cfthrow message="Validation Error" >
        </cfif>

1. Now that all the data has been checked on input, we now need to validate the data on output. Locate where the comment body is output to the screen on or around line 75.
1. Wrap the `#comment.comment#` output in an `encodeForHTML()` call so that the line of code looks similar to this:

        #encodeForHTML(comment.comment)#

1. Make the same update for the `author` output on or around line 72.
1. Open up `/www/blog.cfm` in your browser and navigate to a blog post.
1. Confirm that the page loads successfully.
1. Post a new comment and confirm that it still saves and outputs to the screen. Your blog now has additional security! Remember, even though it has security, it still not be considered 100% secure.