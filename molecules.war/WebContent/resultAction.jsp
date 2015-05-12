<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Result of the action</title>

<link href="CSS/bootstrap.min.css" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="CSS/styles.css" rel="stylesheet">
</head>

<body>

	<div class="container">

		<!-- The justified navigation menu is meant for single line per list item.
           Multiple lines will require custom code not provided by Bootstrap. -->
		<div class="masthead">
			<h3 class="text-muted">Dancing Electron</h3>
			<h4 class="text-muted">Menu</h4>
			<nav>
				<ul class="nav nav-justified">
					<li><a href="#">Home</a></li>
					<li><a href="createMolecule.jsp">Create Molecule</a></li>
					<li><a href="displayMoleculeConfirmation.jsp">Display Molecules</a></li>
	
					<li><a href="about.jsp">About</a></li>
				</ul>
			</nav>
		</div>

		<!-- Jumbotron -->
		<div class="well">
			
			<p class="lead"><%=request.getAttribute("message")%></p>
			
		</div>

		<!-- Site footer -->
		<footer class="footer">
			<p>&copy; ESIAG 2015</p>
		</footer>

	</div>
	<!-- /container -->


	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>