As you write more and larger ColdFusion applications, you will start
looking for ways to improve the performance of your applications. There
are many ways to do this, but perhaps the easiest is to use ColdFusion's
caching mechanisms to reduce the amount of work your application has to
do over and over. Caching simply refers to the idea that you create a
piece of content or data once and hold it in application memory for some
period of time. During that time frame, any part of your application
that needs that content or data uses the copy that was previously
generated rather than regenerating it.

ColdFusion has several different caching mechanisms built in, but they
generally fall into two main categories--programmatic caching and
application server caching.

Programmatic Caching
--------------------

This type of caching is controlled by your application code. You decide
which parts of your application would benefit from being cached and use
CFML tags and attributes to determine what content is cached, as well as
how long your application should use the cached copy before it is
discarded and/or regenerated.

### Query Caching

One of the first types of caching that developers turn to is query
caching. Query caching stores the result of a cfquery action in memory
so you can quickly reuse the dataset returned by the query. This is
especially useful for queries whose result set changes infrequently or
for queries that take some time to execute.

To illustrate this, consider a common use case of selecting countries
that a company ships its products to. That list of countries likely
doesn't change very often, so it would be a good candidate to be cached
by ColdFusion. Your original query might look something like this:

    <cfquery datasource="myDatabase" name="shipToCountries">
        SELECT countryId, countryName
        FROM countries
    </cfquery>

With this query, everywhere in your code that needs a list of countries
you can ship products to will create a call to the database and retrieve
this information. By adding one attribute to your cfquery tag, you can
reduce the number of times that query is run. For example, the following
query will be cached in server memory for 1 hour, meaning that no matter
how many times a page that requires that country list is accessed, the
query will only be run a maximum of 24 times per day.

    <cfquery datasource="myDatabase" name="shipToCountries" cachedWithin="#createTimeSpan( 0, 1, 0, 0 )#">
        SELECT countryId, countryName
        FROM countries
    </cfquery>

The cachedWithin attribute to the cfquery tag instructs ColdFusion to
execute this query ONLY if it does not have a result set from that exact
query in memory already. The createTimeSpan() method is used to give
ColdFusion a range of time to compare to the current system time in
order to decide whether to use the result set in memory or to execute
the query again and cache the result of that execution. In this case,
the timespan is 0 days, 1 hour, 0 minutes, and 0 seconds.

An important note to remember here is that ColdFusion caches result sets
based on the SQL statement contained in the cfquery tag. Therefore, if
you have a dynamic query, a new cached value will be stored for every
variation of the query. For instance, the following query would create a
separate cached query result set for each different value of
form.firstName that was provided (Bob, Bill, Mitch, etc).

    <cfquery datasource="myDatabase" name="user" cachedWithin="#createTimeSpan( 0, 1, 0, 0 )#">
        SELECT userId, firstName, lastName
        FROM users
        WHERE lastName = <cfqueryparam cfsqltype="cf_sql_varchar" value="#form.firstName#">
    </cfquery>   

### Caching Generated Content with cfcache

For caching non-query content, ColdFusion provides the cfcache tag. The
cfcache tag can be used to cache an entire rendered page of content for
a specified amount of time. An example of this might be a page listing
products that all belong to the same category. On high-traffic sites,
caching the rendered output for this page even for as little as 1-2
minutes could cause the application to run significantly faster. To do
this, you simply wrap your page in a cfcache tag like so:

    <cfcache action="cache" timespan="#createtimespan(0,0,2,0)#">
        <html>
            <head></head>
            <body>
                ...page content here...
            </body>
        </html>
    </cfcache>

The cfcache tag can also be used to cache HTML fragments that are likely
to be used across multiple pages. An example might be taking our country
query from earlier and building a select box for use on registration
forms, payment screens, search forms, etc. You could potentially run the
query, build the HTML for a select list using the query results, and
cache that HTML fragment for use later on by all the different pages
that needed that fragment. Below is an example of how this would work to
cache the HTML fragment of the select list for one day.

    <cfcache action="cache" timespan="#createtimespan(1,0,0,0)#">

        <cfquery datasource="myDatabase" name="shipToCountries">
          SELECT countryId, countryName
          FROM countries
        </cfquery>

        <select name="country" id="country">
            <cfloop query="shipToCountries">
                <option value="#shipToCountry.countryId#">#shipToCountry.countryName#</option>    
            </cfloop>
        </select>

    </cfcache>    

The cfcache tag offers fine-grained control on removing content from the
cache as well. This is accomplished by using action="flush" on the
cfcache tag. Coupled with the expireURL attribute, you can flush the
entire cache, a group of pages that match a particular URL pattern, or a
single content item. This is especially useful when the rendered content
that you're caching would be affected by changes to the database that
drives it. In the example above, were a country added to the countries
table, the flush action could be used to ensure that bit of content was
flushed from the cache and rebuilt with the new values on the next
request.

### Caching Generated Content with cfcache

You can manually place data or content inside the internal ColdFusion
Cache, if you prefer. ColdFusion uses the very popular and robust
ehCache product internally. ehCache is an enterprise level caching
product and has many benefits apart from the integrations you'll find in
ColdFusion. Let's look at how we might put data in the cache, then
retrieve it.

    CachePut(id, value);
    CacheGet(id);

In the example above, the id must be unique to the cache. The value is
whatever data or content you want to cache. Here's a practical example:

    <cfset CachePut(42, 'AnswerToEverything') />
    <cfset CacheValue = CacheGet(42) />
    <cfdump var="#CacheValue#" /> 

Once the code completes, you'll have inserted the value
'AnswerToEverything' into the cache and assigned it the key of 42. Then
you will have requested the value matching the key of 42 and received
your original text 'AnswerToEverything'.

You'll do most of your work with CachePut; to help you cache the right
data, there are two optional arguments to CachePut:

    CachePut(id, value[, timeSpan[, idleTime]]);

The timespan argument is the duration the cache should keep the object.
Use CreateTimeSpan() to easily make a timespan for your cache function.

The idleTime argument is a number of days in which to toss out the
cached item if the item has not been accessed in that time. In the next
example, we'll cache our 'AnswerToEverything' value under the key 42 and
ask the cache to cache it for 2 days.

    <cfset CachePut(42, 'AnswerToEverything', CreateTimespan( 2, 0, 0, 0) ) />
    <cfset CacheValue = CacheGet(42) />
    <cfdump var="#CacheValue#" />

The cache will get rid of items automatically according to the rules you
give it. In the above example, the key and value assigned to 42 will be
evicted from the cache in 2 days. You can manually evict whatever you
want from the cache with the CacheRemove() function. The below line of
code will manually remove the key and value assigned to 42.

    <cfset CachePut(42, 'AnswerToEverything', CreateTimespan( 2, 0, 0, 0) ) />
    <cfset CacheValue = CacheGet(42) />
    <cfdump var="#CacheValue#" />
    <cfset CacheRemove(42) />
    <cfset CacheValue = CacheGet(42) />
    <cfdump var="#isNull(CacheValue)#" />
    <cfdump var="#CacheValue#" /> 

If you run the code above, you'll see the cached value appear in the
first dump. Once we use CacheRemove(), if we try to retrieve the key
again, we'll get a null. The example wrapped the first null value in an
IsNull() function so you can see how to properly check and work with
this case. If you try to use a null value in ColdFusion, you will get an
error, because of the last line in which we attempt to use a value that
is null.

### Getting Metrics about Caching

Caching saves processing and database time at the expense of memory. In
order to do caching well, you'll need to know how well your caching
strategy is performing. The first important concept in caching is a
cache-hit. A cache-hit occurs when a request is made for a cached item
and the item is already in the cache. The second important concept in
caching is the concept of the cache-miss. A cache-miss occurs when an
item is requested from the cache and the cache does not have it. You can
get metrics about cache-hits and cache-misses for each of your cached
keys. If you ran this example, you would see the number of cache-hits
and cache-misses for our item \# 42.

    <cfset CachePut(42, 'AnswerToEverything', CreateTimespan( 2, 0, 0, 0) ) />
    <cfset CacheValue = CacheGet(42) />
    <cfdump var="#CacheValue#">
    <cfdump var="#cacheGetMetaData(42)#" />

It is generally a good idea to seek the largest ratio between cache-hits
and cache-misses. This means the cached item is being requested from the
cache. However, the main reason behind caching is to save processing,
data access, web service requests, and other such resources from being
required for each request. Thus, if you have a computationally expensive
request, it may be ok if the difference between cache-hits and
cache-misses isn't so much.The right solution depends on your hardware,
application, types of requests and other factors. Since you now know how
to get information about your cached content, feel free to experiment.

Application Server Caching
--------------------------

In addition to the programmatic methods of caching discussed earlier,
ColdFusion also provides some caching mechanisms managed at the server
level. Settings for these are found in the ColdFusion Administrator web
application and apply to all ColdFusion applications being served by
that particular instance of ColdFusion. The three most important of
these are **Trusted Cache**, **Cache Template in Request**, and **Save
Class Files**. These three caching mechanisms are primarily used on
production systems and are not recommended for use on a ColdFusion
instance that is being used for development purposes.

### Trusted Cache

With Trusted Cache disabled, each time you request a ColdFusion file,
the server will check to see if that file is different from the version
that it previously compiled to Java bytecode. If the file has not
changed, the Java bytecode previously compiled is used. If the file is
different, ColdFusion recompiles the file and uses the new Java bytecode
just compiled. Turning on the Trusted Cache option in the ColdFusion
Administrator will cause ColdFusion to no longer scan your source code
files for changes. Enabling this option eliminates the check for
differences on each request for the file. That means that the first time
a ColdFusion file is requested, the server will compile it as normal.
Thereafter, it will always use the previously compiled version of the
file, even if you have updated the file in the meantime. The ColdFusion
Administrator provides a way to manually clear the Trusted Cache so that
the next request will recompile the current version of the source code
and include any changes to the files since the files were last compiled.
Additionally, the ColdFusion Admin API provides a way to clear the
trusted cache from your code, possibly as part of an automated
deployment process.

Since there can be potentially dozens of ColdFusion files accessed
during a single request cycle, enabling Trusted Cache can have a
significant positive effect to the responsiveness of the server. On
production sites, where source code is likely not changing often, it is
unnecessary to have ColdFusion constantly checking source code files for
changes, and thus that step can be eliminated. Conversely, if this
setting were enabled on a development machine, your development process
would have to include a step to manually clear the Trusted Cache every
time you made a change to a file, which is less than productive.

### Cache Template in Request

The Cache Template in Request setting is very similar to the Trusted
Cache setting discussed above, with the exception that the check is only
skipped for that particular request. For instance, if you call a file
more than once during a request with this setting enabled, the server
will compile the file to Java bytecode on the first invocation and will
use that same bytecode for each subsequent call to the file without
checking to see if the file is different up through the end of the
request. However, unlike Trusted Cache, subsequent requests will
recompile the file the first time it is called during that request. So
while Trusted Cache disables file change checks until you clear the
Trusted Cache or restart the ColdFusion server, Cache Template in
Request only disables file change checks for the duration of the current
request.

It should be noted that if you have enabled the Trusted Cache feature,
you won't see any performance increases from also enabling Cache
Template in Request, as Trusted Cache essentially supersedes this
feature due to the way it works.

### Save Class Files

We've mentioned earlier how the ColdFusion server compiles ColdFusion
files from source code down to Java bytecode. Those bytecode files are
housed in Java class files. Typically, this happens when the ColdFusion
file is first accessed after the server starts. However, you can enable
this option to have ColdFusion save the compiled class files to a
directory on the disk and read them back into memory after a restart.
Depending on how many class files and the amount of traffic to your
application, this can be faster than recompiling the source code to Java
bytecode again.

Your system has a finite amount of memory, and caching done incorrectly
can cause more trouble than you might initially think. There are a
couple settings in the ColdFusion administrator to help control the
amount of caching of certain features.

**Maximum Number of Cached Templates** (ColdFusion Admin -\> Server
Settings \> Caching )\
 ColdFusion will cache templates, pages, and ColdFusion Components into
memory so they do not have to be read from disk when requested.

You can clear the cached templates by clicking the 'Clear Template Cache
Now' button. It is a good idea to do this when you change your source
code files on production. You can also clear a specific folder if you
know which files you specifically want to clear from the template cache.

**Maximum Number of Queries Cached** (ColdFusion Admin -\> Server
Settings \> Caching )\
 ColdFusion will let you place a limit on the number of cached queries
in your application. As a cached query is requested, it moves to the top
of the stack. Unused queries move toward the bottom of the stack. The
query unused the longest is evicted from the Query Cache as the cached
query count hits the limit you set in the ColdFusion administrator.

You can clear the cached queries by clicking the 'Clear Query Cache Now'
button. You may need to do this if the underlying data changes, but the
current caching strategy on the server is still showing the old
information.

