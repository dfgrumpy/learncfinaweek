<cfoutput>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>#getSetting('appName')#</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="//stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="/assets/css/site.css">

  </head>
  <body>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
    


    <a class="navbar-brand" href="##"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="##navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

  <div class="collapse navbar-collapse" id="navbarsExampleDefault">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item <cfif event.getCurrentHandler() eq 'main'>active</cfif>">
        <a class="nav-link" href="#event.buildLink('')#">Home</a>
      </li>
      <li class="nav-item <cfif event.getCurrentHandler() eq 'course'>active</cfif>">
        <a class="nav-link" href="#event.buildLink('course.index')#">Course</a>
      </li>
      <li class="nav-item <cfif event.getCurrentHandler() eq 'contributors'>active</cfif>">
        <a class="nav-link" href="#event.buildLink('contributors.index')#">Contributors</a>
      </li>
      <!-- <li class="nav-item <cfif event.getCurrentHandler() eq 'resources'>active</cfif>">
        <a class="nav-link" href="#event.buildLink('resources.index')#">Resources</a>
      </li> -->
      <li class="nav-item <cfif event.getCurrentHandler() eq 'contact'>contact</cfif>">
        <a class="nav-link" href="#event.buildLink('contact.index')#">Contact</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="https://github.com/dfgrumpy/learncfinaweek" target="_blank">Github</a>
      </li>
      <!---
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="##" id="dropdown01" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Download</a>
        <div class="dropdown-menu" aria-labelledby="dropdown01">
          <a class="dropdown-item" href="##">Course PDF</a>
          <a class="dropdown-item" href="##">Sample Files</a>
        </div>
      </li> --->
    </ul>
  </div>
    <ul class="nav navbar-nav navbar-right">
      <li>
      <img src="/assets/img/logo_nav.png" height="30" class="d-inline-block align-top" alt="">
      </li>
    </ul>
</nav>

<div class="row" style="padding-top: 60px;"></div>
<!---Container And Views --->
<div class="container">#renderView()#</div>



<footer class="footer mt-auto py-3">
  <div class="container">
        <p class="text-center">Code licensed under the <a href="http://www.apache.org/licenses/LICENSE-2.0" target="_blank">Apache License v2.0</a>. Documentation licensed under <a href="http://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a>.</p>
      	<p class="text-center">
      		Hosting provided by <a href="https://www.hostmedia.co.uk/" target="_new">Hostmedia</a>
      	</p>
        <p class="text-center">
          Built using <a href="https://adobe.com/ColdFusion" target="_new">Adobe ColdFusion 2018</a> and 
          <a href="https://www.coldbox.org/" target="_new">ColdBox Framework</a>
        </p>
	  </div>

</footer>


  <script src="//code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="//stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


  <script type="text/javascript">
    $(function () {

      $('[data-toggle="popover"]').on('click', function(){
          $(this).popover({ trigger: 'focus', content: $(this).prev().html()}).popover('show');
      })

    })
  </script>

</html>


</cfoutput>
