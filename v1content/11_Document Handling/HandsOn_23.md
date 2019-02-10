In this hands on example, you are going to make a call to Twitter to get a list of your latest tweets and output them to the contact page.

**Update**: This hands on originally used the twitter api v1, which is no longer supported. We hae updated the code sample to use a different xml file.

**Tags Used**: [\<cfhttp>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7ffc.html), [\<cfloop>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7fe2.html), [\<cfoutput>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7ff6.html)

**Functions Used**: [dateFormat](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7ff4.html)

1. Open up the `/www/contact.cfm` file in your code editor.
1. First, make a `<cfhttp>` call to get the data from Twitter. Create a `<cfhttp>` tag directly after the `<cfset>` block. Your code should be on or around line 7. The `<cfhttp>` tag should have the following attributes:

    * **url**: http://www.learncfinaweek.com/twitter.xml
    * **method**: get
    * **result**: twitterFeed

    > **Note:** If you do not have a twitter screen name you can use the 'simonfree' screen name for now.

1. The code should look similar to this:

        <cfhttp url="http://www.learncfinaweek.com/twitter.xml" method="get" result="twitterFeed" />

1. Now that you have the feed data in the `twitterFeed` variable, you need to output it on the page. To do this, loop over the XML data that was received from Twitter and create a `<cfloop>` tag. Locate the comment that reads `Twitter Output` and create the `<cfloop>` tag before the first `<li>` tag. The `<cfloop>` tag should have the following properties:
    * **array**: #xmlParse(twitterFeed.fileContent).statuses.status#
    * **index**: feedItem
1. Place the closing `</cfloop>` tag after the closing `</li>` tag.
1. Inside the `<li>` tags, place the following line of code:

        #dateformat(feedItem.created_at.xmlText,'mm/dd/yyyy')# - #feedItem.text.xmlText#

1. Now wrap the entire `<cfloop>` block in a `<cfoutput>` tag so that the variables will be displayed to the user. Your code should look similar to this:

        <ul>
            <cfoutput>
                <cfloop array="#xmlParse(twitterFeed.fileContent).statuses.status#" index="feedItem" >
                    <li>
                        #dateformat(feedItem.created_at.xmlText,'mm/dd/yyyy')# - #feedItem.text.xmlText#
                    </li>
                </cfloop>
            </cfoutput>
        </ul>

1. Open up the `/www/contact.cfm` page in your browser and notice that the 5 latest tweets are now displaying under the 'Latest Tweet' heading.