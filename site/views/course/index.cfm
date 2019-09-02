
<cfoutput>
	<div class="row">
		<!---Side Bar --->
		<div class="col-lg-4">
			<div class="accordion" id="accordionExample">
				<cfloop array="#prc.menudata#" index="a">
					<cfset thisCard = {}>
					<cfset thisCard.headingId = "heading_" & left(hash(a.name), 10)>
					<cfset thisCard.collapseId = "collapse_" & left(hash(a.name), 10)>
					<cfset thisCard.headingClass = "card-header p-0">
					<cfset thisCard.headingLinkClass = "btn btn-block text-left">
					<cfset thisCard.bodyClass = "collapse">
					<cfif replace(a.name," ", "_", "all") is prc.section>
						<cfset thisCard.headingClass &= " bg-primary">
						<cfset thisCard.headingLinkClass &= " text-light">
						<cfset thisCard.bodyClass &= " show">
					</cfif>
					<div class="card">
						<div class="#thisCard.headingClass#" id="#thisCard.headingId#">
							<h2 class="mb-0">
								<button class="#thisCard.headingLinkClass#" type="button"
										data-toggle="collapse" data-target="###thiscard.collapseId#"
										aria-expanded="true" aria-controls="#thiscard.collapseId#">
									#a.name#
								</button>
							</h2>
						</div>
						<div id="#thiscard.collapseId#" class="#thisCard.bodyClass#"
								aria-labelledby="#thisCard.headingId#" data-parent="##accordionExample">
							<div class="card-body">
								<div class="list-group">
									<cfloop array="#a.sections#" index="b">
										<cfset thisItem.class = "list-group-item list-group-item-action">
										<cfset thisItem.linkItem = rereplace( b.name, '[\?\s]', "_", "all")>
										<cfset thisItem.linkURL = 'course.index.section.' & replace( a.name," ", "_", "all" )
											& '.item.' & thisItem.linkItem>
										<cfif thisItem.linkItem is prc.item>
											<cfset thisItem.class &= "  bg-secondary text-light">
										</cfif>
										<a href="#event.buildLink( thisItem.linkURL )#"
												class="#thisItem.class#">#b.name#</a>
									</cfloop>
								</div>
							</div>
						</div>
					</div>
				</cfloop>
			</div>
		</div>

		<div class="col-lg-8">
			<div class="jumbotron p-4 p-md-4 rounded shadow">
				<h1>#prc.thisSection.name#</h1>
				<cfif NOT prc.thisSection.name IS prc.thisSection.itemName>
					<h2>#prc.thisSection.itemName#</h2>
				</cfif>
			    <hr>
				<div class="row mb-2 mt-4 ">
			    	<div class="col-md-6 <cfif !prc.thisSection.Revised></cfif>">
				      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				        <div class="col p-4 d-flex flex-column position-static">
				          <strong class="d-inline-block mb-2 text-primary">Content Author</strong>
				          <p class="card-text mb-auto">#prc.thisSection.author#</p>
				          <p class="card-text mb-auto">
				          	<cfif prc.thisSection.authorData.twitter.len()>
					        <a href="https://www.twitter.com/#replace(prc.thisSection.authorData.twitter, "@", "")#" target="_blank">
				          	<img src="/assets/img/Twitter_Social_Icon_Rounded_Square_Color.svg" width="20"> #replace(prc.thisSection.authorData.twitter, "@", "")#
				          	</a>
				          	<cfelse>&nbsp;
				          	</cfif>
				          </p>
				        </div>
				        <div class="col-auto d-none d-lg-block">				      	
							<img src="/assets/contributors/#prc.thisSection.authorData.bioimage#" width="75">
				        </div>
				      </div>
			    	</div>

					<cfif prc.thisSection.Revised>
			    	<div class="col-md-6">
				      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				        <div class="col p-4 d-flex flex-column position-static">
				          <strong class="d-inline-block mb-2 text-primary">Reviewed/Revised By</strong>
				          <p class="card-text mb-auto">#prc.thisSection.reviewer#</p>
				          <p class="card-text mb-auto">
				          	<cfif prc.thisSection.reviewerData.twitter.len()>
					        <a href="https://www.twitter.com/#replace(prc.thisSection.reviewerData.twitter, "@", "")#" target="_blank">
				          	<img src="/assets/img/Twitter_Social_Icon_Rounded_Square_Color.svg" width="20"> #replace(prc.thisSection.reviewerData.twitter, "@", "")#
				          	</a>
				          	<cfelse>&nbsp;
				          	</cfif>
				          </p>
				        </div>
				        <div class="col-auto d-none d-lg-block">				      	
							<img src="/assets/contributors/#prc.thisSection.reviewerData.bioimage#" width="75">
				        </div>
				      </div>
			    	</div>
		    	</cfif>
		    	</div>
			</div>
			#prc.thisSection.content#
		</div>

	</div>

</cfoutput>