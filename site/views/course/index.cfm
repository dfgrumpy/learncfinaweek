
<div class="row">
<!---Side Bar --->
	<div class="col-lg-4">
	
		<div class="accordion" id="accordionExample">

		<cfloop array="#prc.menudata.menu#" index="a">	
			<cfoutput>
			<cfset thisCard = left(hash(a.name), 10)>	
		  <div class="card">
		    <div class="card-header" id="heading_#thiscard#" style="padding: 0 0;">
		        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="##collapse_#thiscard#" aria-expanded="true" aria-controls="collapse_#thiscard#">
		          #a.name#
		      </h2>
		    </div>
		    <div id="collapse_#thiscard#" class="collapse hide" aria-labelledby="heading_#thiscard#" data-parent="##accordionExample">
		      <div class="card-body">
		       <div class="list-group">
					<cfloop array="#listtoarray(a.sections)#" index="b">

						<a href="#event.buildLink('course.index.section.#replace(a.name," ", "-", "all")#.item.#replace(b," ", "-", "all")#')#" class="list-group-item">#b#</a>
					</cfloop>
				</div>
		      </div>
		    </div>
		  </div>
		  </cfoutput>
		</cfloop>
		</div>
	</div>
	<div class="col-lg-8">

		<cfoutput>
		Section: #rc.section#
		</cfoutput>
	</div>

</div>

