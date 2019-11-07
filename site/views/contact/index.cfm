

<div class="rounded bg-dark text-white pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
  <h1 class="display-4">Contact Us</h1>
  <p class="lead">
  	If you have any questions about the Learn CF in a Week content<br /> or any other input please contact us using one of the methods below.
  </p>
</div>


<div class="col-lg-12 m-2">&nbsp;</div>

<div class="col-lg-12">
  <div class="card-deck mb-3 text-center">
    <div class="card mb-4 shadow-sm">
      <div class="card-header">
        <h4 class="my-0 font-weight-normal">Content Board</h4>
      </div>
      <div class="card-body">
        <ul class="list-unstyled mt-3 mb-4">

        <cfloop array="#prc.contributors.authors#" item="author">
			<cfif ! author.admin>
				<cfcontinue />
			</cfif>
			<cfoutput>
				<li class="mb-4"><h4>#author.author#</h4>
					<cfif author.twitter.len()>
			        <a href="https://www.twitter.com/#replace(author.twitter, "@", "")#" target="_blank" >
		          	<img src="/assets/img/Twitter_Social_Icon_Rounded_Square_Color.svg" width="20"> #replace(author.twitter, "@", "")#
		          	</a>
		          	</cfif>
				</li>
			</cfoutput>
		</cfloop>
        </ul>
      </div>
    </div>
    <div class="card mb-4 shadow-sm">
      <div class="card-header">
        <h4 class="my-0 font-weight-normal">Google Group</h4>
      </div>
      <div class="card-body d-flex flex-column">
        <h4 class="card-title pricing-card-title">
        	Best place to ask questions is the community backed google group
        </h4>
        <a href="https://groups.google.com/d/forum/learn-cf-in-a-week-public" target="_blank" class="mt-auto btn btn-primary">View Google Group</a>
      </div>
    </div>


    <div class="card mb-4 shadow-sm">
      <div class="card-header">
        <h4 class="my-0 font-weight-normal">CFML Slack</h4>
      </div>
      <div class="card-body  d-flex flex-column">
        <h4 class="card-title pricing-card-title">
        	For interactive Q/A check out the cfml.slack.com channel
        </h4>
        <a href="https://cfml.slack.com/" target="_blank" class="mt-auto btn btn-primary">View Slack Channel</a>        
      </div>
    </div>

</div>



