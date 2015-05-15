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

<title>Signin</title>

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
	<h1>Dancing Electron</h1>

		<form class="form-signin">
			<h2><label for="pleaseSignIn" class="form-signin-heading"><fmt:message key="pleaseSignIn" /></label></h2>
			
			<input type="text" id="username" class="form-control" placeholder="<fmt:message key="username" />" required > 
			
			<input type="password" id="inputPassword" class="form-control" placeholder="<fmt:message key="password" />" required>
			
			<button class="btn btn-lg btn-primary btn-block" type="submit"><fmt:message key="signIn" /></button>
		</form>


			
				<br>
				<br>
				<p align="center">
				<img src="http://www.openschool.bc.ca/features/images/sc9/sc0931a_electrons_animated.gif">		
				</p>
			
	</div>
	<!-- /container -->


	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
