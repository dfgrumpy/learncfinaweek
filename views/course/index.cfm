
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
										<cfset thisItem.linkItem = replace( replace( b.name, "?", "", "all") ," ", "_", "all")>
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
			<div class="jumbotron">
				<h1>#prc.thisSection.name#</h1>
				<cfif NOT prc.thisSection.name IS prc.thisSection.itemName>
					<h2>#prc.thisSection.itemName#</h2>
				</cfif>
				<hr class="my-4">
					<dl class="row">
						<dt class="col-sm-4">Content Author:</dt>
						<dd class="col-sm-8">#prc.thisSection.author#</dd>
						<cfif prc.thisSection.Revised>
							<dt class="col-sm-4">Reviewed/Revised By: </dt>
							<dd class="col-sm-8">#prc.thisSection.reviewer#</dd>
						</cfif>
					</dl>
			</div>
			#prc.thisSection.content#
		</div>

	</div>

</cfoutput>