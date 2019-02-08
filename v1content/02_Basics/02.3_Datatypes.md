In our last Section, we talked about variables, data, and how to
transport data around in your application. Different data types serve
different purposes.

Strings/Numbers
---------------

**Is Simple:** Yes

Strings and numbers are very easy to work with. To set a string or a
number, use the cfset command. To append strings and numbers to each
other, use the & operator:

~~~~ {.prettyprint}
<cfset aString = "hi" />
<cfset aNumber = 42 />
<cfset aStringAndANumber = aString & aNumber />   

aString: <cfoutput>#aString#</cfoutput>
aNumber: <cfoutput>#aNumber#</cfoutput>
aStringAndANumber: <cfoutput>#aStringAndANumber#</cfoutput>
~~~~

If you have a big block of strings to set, you can use the cfsavecontent
command.

~~~~ {.prettyprint}
<cfsavecontent variable="EmailContent">
    Hi 

    We want to send you a hoverboard.
    Let us know if you will accept this free offer.

    -Us
</cfsavecontent>

<cfoutput>#EmailContent#</cfoutput>
~~~~

Dates
-----

**Is Simple:** Kind of

Dates are also very easy to work with in ColdFusion. You can use built
in functions like now() to make a date, or you can type the date into
the variable assignment like this:

~~~~ {.prettyprint}
<cfset DateToday = now() />
<cfset NewYearDay = "1/1/2013" />
~~~~

You can use built-in functions to work with dates. To show how many days
it has been since the turn of the century:

~~~~ {.prettyprint}
<cfset DaysSinceTurnOfCentury = DateDiff("d", "1/1/2000", now() ) />
<cfoutput>#DaysSinceTurnOfCentury#</cfoutput>
~~~~

Or suppose you want to know what the date will be 42 days from now:

~~~~ {.prettyprint}
<cfset FortyTwoDaysFromNow = DateAdd("d", now(), 42 ) />
~~~~

ColdFusion provides many useful functions to work with dates and times.
You can compare dates, find out how far two dates are apart, reformat a
date, and more. See the ColdFusion Date/Time documentation for a full
listing:
[http://help.adobe.com/en\_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec1a60c-7ffc.html\#WSc3ff6d0ea77859461172e0811cbec22c24-6986](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec1a60c-7ffc.html#WSc3ff6d0ea77859461172e0811cbec22c24-6986)

Arrays
------

**Is Simple:** No

Arrays are an ordered series of data. Here's an example of a one
dimensional array:

### Array Creation

~~~~ {.prettyprint}
<cfset ThingsILike = ["Warm Sandy Beaches", "Tropical Drinks", 42] />
<cfdump var = "#ThingsILike#" />
~~~~

### Alternate Method: Array Creation

Here's another way to create an array, along with a couple of different
ways to add data to an array:

~~~~ {.prettyprint}
<cfset ThingsILike = arrayNew(1) />
~~~~

### Adding Items to an Array

You can add things by a specific position. Note: Arrays in ColdFusion
start at 1, not 0.

~~~~ {.prettyprint}
<cfset ThingsILike[1]  = "Warm Sandy Beaches" />
~~~~

### Alternate Method: Adding Items to an Array

You can append an item to the end of the array:

~~~~ {.prettyprint}
<cfset ArrayAppend( ThingsILike,  "Tropical Drinks") />
<cfset ArrayAppend( ThingsILike,  42) />
<cfdump var="#ThingsILike#" />
~~~~

See how I defined the strings in my array with quotes, and non-strings
without? Each element in the array is an execution zone also, so if you
need ColdFusion to evaluate something, just add it in:

~~~~ {.prettyprint}
<cfset ImportantDates = ["12/26/1975", now() ] />
<cfdump var = "#ImportantDates#" />
~~~~

### Displaying the Contents of an Array

You can not use the cfoutput command on an array because complex data
types such as arrays are not displayable as a string. You can loop over
the array, however, and output the strings to the page:

~~~~ {.prettyprint}
<cfset ThingsILike = ["Warm Sandy Beaches", "Tropical Drinks", 42] />
<cfloop array="#ThingsILike#" index="thing">
    <cfoutput>#thing#</cfoutput>
</cfloop>
~~~~

ColdFusion provides many useful functions to work with arrays. You can
search the contents of an array for a value, perform mathematical
functions such Sum or Average, sort the contents of an array, and more.
See the ColdFusion Array function documentation for a full listing:
[http://help.adobe.com/en\_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec1a60c-7ffc.html\#WSc3ff6d0ea77859461172e0811cbec22c24-6a66](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec1a60c-7ffc.html#WSc3ff6d0ea77859461172e0811cbec22c24-6a66)

Structs
-------

**Is Simple:** No

Structs, aka Structures, are a collection of data, stored by a key, or
name. Suppose for example, you wanted to store several kinds of fruit
and also whether you like it or not. Structs provide a way to organize
like name/value pairs and let you refer to them as a single collection.

### Struct Creation

~~~~ {.prettyprint}
<cfset FruitBasket = structNew() />
~~~~

### Alternate Method: Struct Creation

~~~~ {.prettyprint}
<cfset FruitBasket = {} />
~~~~

### Adding Items to a Struct: Bracket Notation

~~~~ {.prettyprint}
<cfset FruitBasket = {} />
<cfset FruitBasket["Apple"] = "Like" />
<cfset FruitBasket["Banana"] = "Like" />
<cfset FruitBasket["Cherry"] = "Dislike" />

<cfdump var = "#FruitBasket#" />
~~~~

### Adding Items to a Struct Dot Notation

~~~~ {.prettyprint}
<cfset FruitBasket = {} />
<cfset FruitBasket.Apple = "Like" />
<cfset FruitBasket.Banana = "Like" />
<cfset FruitBasket.Cherry = "Dislike" />

<cfdump var = "#FruitBasket#" />
~~~~

### Struct Creation and Population in One Statement

~~~~ {.prettyprint}
<cfset fruitBasket = {
    "Apple" = "Like",
    "Banana" = "Like",
    "Cherry" = "Dislike"
} />
<cfdump var = "#FruitBasket#" />
~~~~

> **Pro Tip:** There are reasons to use one struct notation over
> another. If you ran some of these examples you would notice that the
> Bracket Notation preserved the case of the keys and the Dot Notation
> did not. Sometimes the preservation of case is important, like when
> passing values to Javascript or other case sensitive languages or
> formats. In the Struct Creation and Population in One Statement
> Example, the case will be preserved as long as they keys are
> surrounded by quotes. If the keys are not quoted, the case will be
> converted to upper case. \
> \
> Also, the bracket notation allows for a dynamic key reference. This is
> helpful when the name of the struct key will come from a runtime
> operation, such as looping over the struct. Many people find Dot
> Notation easier to read and use it most of the time, except in cases
> where Bracket Notation offers a feature Dot Notation does not.

### Displaying the Contents of a Struct

See how your preference was mapped to the kind of fruit? You can't use
the cfoutput command on structs either because, once again, they aren't
displayable as a string. You can loop over the struct and output the
keys and values to the page:

~~~~ {.prettyprint}
<cfloop collection="#FruitBasket#" item="fruit">
    <cfoutput>I #FruitBasket[fruit]# #fruit#</cfoutput><br />
</cfloop>
~~~~

ColdFusion provides many functions to work with structs. You can search
the contents of struct, make complete and partial copies, retrieve a
list of just the keys, and more. See the ColdFusion Struct function
documentation for a full listing:
http://help.adobe.com/en\_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec1a60c-7ffc.html\#WSc3ff6d0ea77859461172e0811cbec22c24-69b8

Queries
-------

**Is Simple:** No

Queries are recordsets. Recordsets contain a series of columns with 0 or
more rows. You can think of a query like a single page of a spreadsheet
with the columns across the top and rows down the side.

Most ColdFusion programs interact with databases. Database interaction
takes the form of a query and ColdFusion makes it very easy to work with
the data returned by the database. Databases will be covered more in
more detail later on in the course.

~~~~ {.prettyprint}
<cfquery name="FruitQuery" datasource="fruit">
    SELECT Name, Price
    FROM FruitStore
    WHERE Price < 7
</cfquery>

<cfloop query="FruitQuery">
    #FruitQuery.Name# costs #FruitQuery.Price# <br />
</cfloop>
~~~~

Query Objects have a few special properties. You can use these
properties to get specific information about the data inside the query.

-   **queryname.recordcount**: How many rows does this query have?
-   **queryname.columnlist**: What columns does this query have?
-   **queryname.currentrow**: What row number are we currently on inside
    a cfoutput or cfloop?

ColdFusion provides several useful functions to work with query objects.
You can create your own query objects in ColdFusion without a database
call or even retrieve all the values in a specific column in a list
format. See the ColdFusion Query function documentation for a full
listing:
[http://help.adobe.com/en\_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec1a60c-7ffc.html\#WSc3ff6d0ea77859461172e0811cbec22c24-67fe](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec1a60c-7ffc.html#WSc3ff6d0ea77859461172e0811cbec22c24-67fe)

Also, be sure to review the Accessing and Using Data portion of the
ColdFusion documentation, which explains a number of key concepts and
techniques for working with data, databases and query objects:
[http://help.adobe.com/en\_US/ColdFusion/10.0/Developing/WS8f0cc78011fffa7168855f811cdb0b0cce-8000.html](http://help.adobe.com/en_US/ColdFusion/10.0/Developing/WS8f0cc78011fffa7168855f811cdb0b0cce-8000.html)

