<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<title>Dancing Electron Display Molecule</title>

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
			<h4 class="text-muted">Display Molecule</h4>
			<nav>
				<ul class="nav nav-justified">
					<li><a href="menu.jsp">Home</a></li>
					<li><a href="createMolecule.jsp">Create Molecule</a></li>
					<li><a href="#">Display Molecules</a></li>

					<li><a href="about.jsp">About</a></li>
				</ul>
			</nav>
		</div>
		

		<div class="well">
			<form action="GUIServlet?action=display" method="POST">
				
				Are you sure you want to display your molecules ?<br>

				<input type="submit" value="Yes">
				or just go back to the 
				<a href="menu.jsp"> menu</a>
			</form>
			
				
			
			
			
		</div>

		<!-- Site footer -->
		<footer class="footer">
			<p>&copy; ESIAG 2015</p>
		</footer>

	</div>
	<!-- /container -->


</body>
</html>