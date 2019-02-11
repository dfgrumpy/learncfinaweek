In this hands on we will change our locale and update the date and time outputs to change the display based on our locale.

**Functions Used**: [LsdateFormat](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-6de1.html), [LstimeFormat](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-6dd5.html), [setLocale](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7fa3.html)

1. To be able to change the date and time formats based on our locale, you need to update the functions used for date and time output. Open up the `/www/blogpost.cfm` file in your code editor.
1. Locate the `blogPost.datePosted` variable output on or around line 52.
1. Replace the `dateFormat` code with the following line of code:

        #LsdateFormat(blogPost.datePosted,'short')#

1. Locate the `comment.createdDateTime` variable on or around line 72.
1. Change the dateformat code with the following code:

        #LsdateFormat(comment.createdDateTime,'short')#

1. Change the `timeFormat` code with the following code:

        #LstimeFormat(comment.createdDateTime,'medium')#

1. Open up the `/www/blog.cfm` page in your browser.
1. Navigate to a blog post and review the date and time output. If you are based in the U.S., you will probably not notice any difference. If you are outside of the U.S., then you will probably see a different date and time format.
1. To allow everyone to see a change in the formatting, let’s create a temporary page which will change our locale. Create a file called `updateLocale.cfm` in the `/www/` folder.
1. Open up the `/www/updateLocale.cfm` file in your code editor.
1. Add the following line of code:

        <cfset setLocale('English (UK)') />

1. Open up the /www/updateLocale.cfm page in your browser. You will not see any output, but the new locale has been set (unless you are in the UK; in that case, you should try a different locale such as English (US) ).
1. Navigate back to the /www/blog.cfm page and click on a blog post. You should now notice that the date and time formats have changed. The changes might be slight, but they are there.