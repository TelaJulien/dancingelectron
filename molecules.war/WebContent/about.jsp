<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="internationalisation.text" />
<!DOCTYPE html>
<html lang="${language}">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Dancing Electron Menu</title>

<link href="CSS/bootstrap.min.css" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="CSS/styles.css" rel="stylesheet">
</head>

<body>

	<div class="container">
	
	<form>
            <select id="language" name="language" onchange="submit()">
            	<option value="fr" ${language == 'fr' ? 'selected' : ''}>Français</option>
                <option value="en" ${language == 'en' ? 'selected' : ''}>English</option>
            </select>
        </form>

		<!-- The justified navigation menu is meant for single line per list item.
           Multiple lines will require custom code not provided by Bootstrap. -->
		<div class="masthead">
			<h3 class="text-muted">Dancing Electron</h3>
			<h4 class="text-muted"><fmt:message key="about" /></h4>
			<nav>
				<ul class="nav nav-justified">
					<li><a href="menu.jsp">Home</a></li>
					<li><a  href="createMolecule.jsp"><fmt:message key="createMolecule" /></a></li>
					<li><a  href="displayMoleculeConfirmation.jsp"><fmt:message key="displayMolecule" /></a></li>
	
					<li><a  href="#"><fmt:message key="about" /></a></li>
				</ul>
			</nav>
		</div>
		<div class="well">
			
			<p class="lead"><fmt:message key="aboutMessage" /></p>
		</div>
			<div class="well">
			
			<p class="lead"><fmt:message key="team" /></p>
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