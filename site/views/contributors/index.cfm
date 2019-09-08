
<div class="card rounded bg-dark text-white mt-2 mb-4">
  <div class="card-body">
    <h2>Contributors</h2>
  </div>
</div>



<cfset arrCounter = 1>
<cfloop array="#prc.contributors.authors#" item="author">

	<cfif arrCounter mod 2>
		<div class="row mb-2">
	</cfif>

	
	<cfoutput>
	<div class="col-md-6">
		<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
			<div class="col-auto d-none d-lg-block">
				<img src="/assets/contributors/#author.bioimage#" height="225">
			</div>
			<div class="col p-4 d-flex flex-column position-static">
				<h3 class="mb-0">#author.author#</h3>
				<p class="card-text mb-auto">#author.bioshort#
				<cfif len(author.bio) gt len(author.bioshort)>
					<span class="d-none">#author.bio#</span>
					<a href="##/" class="text-right" data-html="true" data-container="body" data-toggle="popover" data-placement="right" data-title="#author.author#">(more)</a>
				</cfif>
				</p>
				<cfif author.twitter.len()>
			        <a href="https://www.twitter.com/#replace(author.twitter, "@", "")#" target="_blank">
		          	<img src="/assets/img/Twitter_Social_Icon_Rounded_Square_Color.svg" width="20"> #replace(author.twitter, "@", "")#
		          	</a>
	          	</cfif>
			</div>
		</div>
	</div>

	</cfoutput>
	

	<cfif ! arrCounter mod 2>
		</div>
	</cfif>


	<cfset arrCounter++>

</cfloop>

<cfif ! arrCounter mod 2>
	</div>
</cfif>



<style>

	.popover {
		max-width: 350px !important;
	}

</style>

