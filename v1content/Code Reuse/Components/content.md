A more modern alternative to cfinclude is to create components.
Components in ColdFusion behave similarly to objects in many other
programming languages. First, start by creating a new file, called
Greeting.cfc. ColdFusion uses .cfc to denote files that are components.

Inside of Greeting.cfc, add a cfcomponent tag:

~~~~ {.prettyprint}
<cfcomponent>

</cfcomponent>
~~~~

It doesn't do much, but there it is. If you prefer script over tags, you
can write a script-only component, too:

~~~~ {.prettyprint}
component {
}
~~~~

The only caveat to script components is that you can not use any tags
inside them, and unfortunately, the cfscript language is currently
incomplete. There are some tags that you can not use in script. Adobe is
chipping away at the list of unavailable tags with each release of
ColdFusion, and there is even a community project that adds additional
script functionality by simply adding a few CFCs to the right folder of
your ColdFusion installation. One popular alternative is to use a
tag-based component, but immediately inside it, switch to script. This
gives you the opportunity to write a few tag-based functions that wrap
up what you need from CF's built in tags so that you can call those tags
from your script:

~~~~ {.prettyprint}
<cfcomponent>
    <cfscript>
    </cfscript>
</cfcomponent>
~~~~

Think of this component like a bucket of code that you can carry around.
You can hand it to a friend, and she can execute it, or she can hand it
to her friend, or give it back to you. She can put more code in the
bucket, or read values from it too. Components have properties, both
public and private, and methods (functions). Properties are like labels
on your bucket. You can read the label, and you can change its value.

For now, let's add functions to the component.

~~~~ {.prettyprint}
component {
    public string function getFullName (String firstName, String lastName) {
        var fullName = arguments.firstName && arguments.lastName;
        return fullName;
    }

    public string function getGreeting (String firstName, String lastName) {

        var fullName = getFullName(argumentCollection=arguments);
        var greeting = "Hello, " & fullName;

        return greeting;
    }
}
~~~~

Suppose we wanted make different types of greetings. Right now, the
getGreeting function only allows us to say Hello. What we can do is
create a baseGreeting that will be available to all of the functions in
the component.

~~~~ {.prettyprint}
component {
    this.baseGreeting = "Hello, ";

    public string function getFullName (String firstName, String lastName) {
        var fullName = arguments.firstName & " " & arguments.lastName;
        return fullName;
    }

    public string function getGreeting (String firstName, String lastName) {
        var fullName = getFullName(argumentCollection=arguments);
        var greeting = this.baseGreeting & fullName;

        return greeting;
    }
}
~~~~

Now the base greeting is available to all of the functions in the
component. Additionally, because we have put baseGreeting into the
scope, it will also be available to whatever pages or other components
call on the Greeting component.

If we want to make baseGreeting unavailable to other pages and
components, we can put baseGreeting into the variables scope like so:

~~~~ {.prettyprint}
component {
    variables.baseGreeting = "Hello, ";

    public string function getFullName (String firstName, String lastName) {
        var fullName = arguments.firstName & " " & arguments.lastName;
        return fullName;
    }

    public string function getGreeting (String firstName, String lastName) {
        var fullName = getFullName(argumentCollection=arguments);
        var greeting = variables.baseGreeting & fullName;

        return greeting;
    }

}
~~~~

Now that baseGreeting is in the variables scope, it can only be accessed
from within the Greeting component. In looking at how to call the
functions using the component, there are a few options. The first is
using cfinvoke.

~~~~ {.prettyprint}
<cfobject 
    component = "Greeting.cfc" 
    name = "greeting" >

<cfinvoke component="greeting" method="getGreeting" returnVariable="myGreeting">
    <cfinvokeargument name="firstName" value="Emily" />
    <cfinvokeargument name="lastName" value="Christiansen" />
</cfinvoke>

<cfoutput>
    #greeting#
</cfoutput>
~~~~

First, cfobject was used to create an instance of our Greeting
component. Then, the cfinvoke tag was used to call the getGreeting
function. Using cfobject allows us to reuse the greeting component as
many times as needed instead of re-instantiating it every time we want
to call a function. The first thing you probably noticed about the above
section is that it is an awful lot of code to do three things: 1)
Instantiate the object 2) Invoke the function 3) Display the result.

Fortunately, there is a way to simplify this process. Let's start by
instantiating our object:

~~~~ {.prettyprint}
<cfset Greeting = CreateObject("Component", "path.to.component.Greeting") />
~~~~

What we've done is use ColdFusion's built in CreateObject function to
make an instance of our greeting component. CreateObject takes in two
parameters:

-   **type**: The type of object you want ColdFusion to create. In the
    example above we are making a component, so we pass in the string
    "Component". As of ColdFusion 9, this is no longer a required
    parameter.
-   **component-name**: The path to the component. Unlike the template
    argument for cfinclude, this argument takes the path to the
    component with each directory separated by dots instead of slashes.
    Because of this, it is not necessary to add the .cfc extension on to
    your file name. If you do, it will interpret the above as file
    ".cfc" in the folder "Greeting".

Now that we have the object, we can invoke the function:

~~~~ {.prettyprint}
<cfset myGreeting = Greeting.getGreeting(firstName="Emily", lastName="Christiansen") />
~~~~

Notice how we have switched to a dot notation, similar to our examples
of helper functions above. Now we get the sense of the object (the
Greeting) doing something (the function). This is far more readable and
descriptive than the alternative.

Finally, we can output the results:

~~~~ {.prettyprint}
<cfoutput>
    #myGreeting#
</cfoutput>
~~~~

Ultimately, our finished, refactored example looks like this:

~~~~ {.prettyprint}
<cfset Greeting = CreateObject("Component", "Greeting.cfc") />
<cfset myGreeting = Greeting.getGreeting(firstName="Emily", lastName="Christiansen") />
<cfoutput>
    #myGreeting#
</cfoutput>
~~~~

Conclusion
----------

ColdFusion offers a wide variety of ways to accomplish code reuse. By
leveraging these techniques, you will find your code to be less
repetitive and more fun to write. Code reuse is not an end in and of
itself; rather, it is a means to another end: maintainability. Having
code that is broken up into concise, self-documenting parts enables you
to read and interpret code much more quickly.

