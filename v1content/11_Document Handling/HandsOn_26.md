In this hands on, we are going to import and export data into the blog section using Excel.

**Tags Used**: [\<cffile>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7fa1.html), [\<cfspreadsheet>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec17cba-7f87.html), [\<cfloop>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7fe2.html), [\<cfset>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7ffd.html), [\<cfscript>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7ebf.html), [\<cfheader>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7aea.html), [\<cfcontent>](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7c82.html)

**Functions Used**: [getTempDirectory](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-7c61.html), [EntityNew](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSfd7453be0f56bba437188258123092b394c-7ffe.html), [EntitySave](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WS89F68C3F-0F5F-4c1b-88C4-4299A1E7F28A.html), [ormFlush](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WS64D9E5CE-6D02-46f2-98C1-785505BBF20B.html), [EntityLoad](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WS32C28934-CDCE-497f-8212-6342141C5846.html), [spreadsheetNew](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-747b.html), [spreadsheetAddRow](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-67ad.html), [spreadsheetFormatRow](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-676f.html), [spreadsheetAddRows](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSc3ff6d0ea77859461172e0811cbec22c24-6790.html), [spreadsheetWrite](http://help.adobe.com/en_US/ColdFusion/10.0/CFMLRef/WSe9cbe5cf462523a0-7b585809122c5a12c54-7fff.html)

1. First, let's look at the import process. Open up the `/www/admin/content/blog/importBlog.cfm` file in your code editor.
1. Before importing a spreadsheet, we must first move it to the server. Locate the `Upload File` comment tag. On the line below, create a `<cffile>` tag with the following attributes:
    * **action**: upload
    * **destination**: #getTempDirectory()#
    * **fileField**: importFile
    * **nameconflict**: makeunique
1. Your code should look similar to this:

    <cffile action="upload" destination="#getTempDirectory()#" filefield="importFile" nameconflict="makeunique" />

1. Once the file is on the server, we can parse the file and put it into a query variable by using the `<cfspreadsheet>` tag. Locate the `Read Spreadsheet` comment and create a `<cfspreadsheet>` tag on the line below with the following attributes:
    * **action**: read
    * **src**: #cffile.serverDirectory#/#cffile.serverfile#
    * **query**: importData
    * **headerRow**: 1
    * **excludeHeaderRow**: true
1. Your code should look similar to this:

        <cfspreadsheet action="read" src="#cffile.serverDirectory#/#cffile.serverfile#" query="importData" headerrow="1" excludeheaderrow="true" />

1. Once the spreadsheet has been read into a query variable, loop over the query and create a new `blogPost` entity for each row. To do this, locate the `Import Data` comment tag and create a new `<cfloop>` tag below it with the following attribute:
    * **query**: importData
1. Inside the `<cfloop>` tag, create a `<cfset>` tag that loads in a new `blogPost` entity and saves it in a variable called `blogPost`.
1. Below the `<cfset>`, create new `<cfset>` tags that set the title, summary, body, and date posted values. Note that because the Date Posted column in the spreadsheet has a space in it, you must use bracket notation to access the value rather than dot notation. Your code should look similar to this:

        <cfloop query="importData">
            <cfset blogPost = EntityNew('blogPost') />
            <cfset blogPost.title = importData.title />
            <cfset blogPost.summary = importData.summary />
            <cfset blogPost.body = importData.body />
            <cfset blogPost.dateposted = importData\['Date Posted'\] />
        </cfloop>

1. The next step is to save the entity. Just before the closing `</cfloop>` tag, create a `<cfset>` tag that calls `EntitySave` on the `blogPost` entity.
1. After the closing `</cfloop>` tag, create another `<cfset>` tag that calls `ormFlush()`. This will commit all changes to the database. Your final code should look similar to this:

        <!--- Upload File--->
        <cffile action="upload" destination="#getTempDirectory()#" filefield="importFile" nameconflict="makeunique" />

        <!--- Read Spreadsheet --->
        <cfspreadsheet action="read" src="#cffile.serverDirectory#/#cffile.serverfile#" query="importData" headerrow="1" excludeheaderrow="true" />

        <!--- Import Data --->
        <cfloop query="importData">
            <cfset blogPost = EntityNew('blogPost') />
            <cfset blogPost.title = importData.title />
            <cfset blogPost.summary = importData.summary />
            <cfset blogPost.body = importData.body />
            <cfset blogPost.dateposted = importData\['Date Posted'\] />
            <cfset EntitySave(blogPost) />
        </cfloop>

        <cfset ormFlush() />

1. Open up the `/www/admin/content/blog/importBlog.cfm` page in your browser.
1. Select an Excel file and click 'Import'. A template Excel file can be found at: `/www/assets/blogImport.xslx`.
1. Go to the `/www/admin/content/blog/listblogpost.cfm` page in your browser and you will see the imported blog posts.
1. Now that the import process is completed, you are going to create an export process. Create a new file called `exportBlog.cfm` in the `/www/admin/content/blog/` folder.
1. Open up the `/www/admin/content/blog/exportBlog.cfm` file in your code editor.
1. For this task, you are going to write some of it in *cfscript*, so you will need to create a new `<cfscript>` block.
1. Inside the `<cfscript>`, create a variable called `blogPosts` that contains all the `blogPost` entities. You can do this by calling `EntityLoad('blogPost')`.
1. On the next line, create a new spreadsheet called `exportSpreadhseet` by calling the `SpreadsheetNew` function and pass it in a string of 'Blog Posts'. This will name our first sheet Blog Posts. Your code should look similar to this:

        <cfscript>
            blogPosts = EntityLoad('blogPost');
            exportSpreadsheet = SpreadsheetNew('Blog Posts');
        </cfscript>

1. Once you have the spreadsheet object created, add a heading row. To do this, call the `SpreadsheetAddRow` function and pass it in the `exportSpreadhseet` object with a comma delimited string of the column headings you want. For this example, the code will look similar to:

        SpreadsheetAddRow(exportSpreadsheet,'ID,Title,Summary,Body,Date Posted');

1. As this row is a header row, you will want to add some styles to denote that. Using the `SpreadsheetFormatRow` function, format the first row so it is Bold and aligned center. To do this, place the following code below the `SpreadsheetAddRow` call:

        SpreadsheetFormatRow(exportSpreadsheet,{bold=true,alignment='Center'},1);

1. Once the header is formatted, add the remaining data to the spreadsheet. Loop over the query and call `SpreadsheetAddRow` on each iteration and pass in the `spreadsheetObject`, in this case `exportSpreadsheet`, and a list of data. The code should look like this:

        for(blogPost in blogPosts){
            SpreadsheetAddRow(exportSpreadsheet,'#blogPost.id#,#blogPost.title#,#blogPost.summary#,#blogPost.body#,#blogPost.datePosted#');
        }

1. Now that all the data is in the spreadsheet, save the spreadsheet to the server. To do that, call the `spreadsheetWrite` function and pass it in the `spreadsheetObject`, which is the path of the file we want it to be written to, and you can choose to overwrite the file that might already be there. In this case, write the file to the servers temp directory and have it overwrite any file that might already exist with the same name by using the following code:

        SpreadsheetWrite(exportSpreadsheet,getTempDirectory() & 'blogPosts.xls',true);

1. Our completed `<cfscript\>` block should look similar to this:

        <cfscript>
            blogPosts = EntityLoad('blogPost');
            exportSpreadsheet = SpreadsheetNew('Blog Posts');
            SpreadsheetAddRow(exportSpreadsheet,'ID,Title,Summary,Body,Date Posted');
            SpreadsheetFormatRow(exportSpreadsheet,{bold=true,alignment='Center'},1);
            for(blogPost in blogPosts){
                SpreadsheetAddRow(exportSpreadsheet,'#blogPost.id#,#blogPost.title#,#blogPost.summary#,#blogPost.body#,#blogPost.datePosted#');
            }
            SpreadsheetWrite(exportSpreadsheet,getTempDirectory() & 'blogPosts.xls',true);
        </cfscript>

1. Now that the spreadsheet has been created, you need to serve it up to the user. Use a `<cfheader>` tag and a `<cfcontent>` tag. First, start with the `<cfheader>` tag, which tells the browser to serve it up in line and what the filename should be. Place the following code after the closing `</cfscript>` tag:

        <cfheader name="Content-Disposition" value="inline; filename=blogPosts.xls" />

1. Finally, use the `<cfcontent>` tag, which tells what file needs to be served and what type of file it is.You can do this by using the following code, which should be placed right after the `<cfheader>` tag:

        <cfcontent file="#getTempDirectory()#blogPosts.xls" type="vnd.ms-excel" />

1. Your completed file should look similar to this:

        <cfscript>
            blogPosts = EntityLoad('blogPost');
            exportSpreadsheet = SpreadsheetNew('Blog Posts');
            SpreadsheetAddRow(exportSpreadsheet,'ID,Title,Summary,Body,Date Posted');
            SpreadsheetFormatRow(exportSpreadsheet,{bold=true,alignment='Center'},1);
            for(blogPost in blogPosts){
                SpreadsheetAddRow(exportSpreadsheet,'#blogPost.id#,#blogPost.title#,#blogPost.summary#,#blogPost.body#,#blogPost.datePosted#');
            }
            SpreadsheetWrite(exportSpreadsheet,getTempDirectory() & 'blogPosts.xls',true);
        </cfscript>

        <cfheader name="Content-Disposition" value="inline; filename=blogPosts.xls" />
        <cfcontent file="#getTempDirectory()#blogPosts.xls" type="vnd.ms-excel" />

1. In a browser, navigate to the `/www/admin/content/blog/exportBlog.cfm` page. You might be prompted to download a file if the download does not start automatically. Open up the Excel file and review the data that has been exported.