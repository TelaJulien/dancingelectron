<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<title>Dancing Electron Update Molecule</title>

<link href="CSS/bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<link href="CSS/styles.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script>
	$(document)
			.ready(
					function() {
						var max_fields = 10; //maximum input boxes allowed
						var wrapper = $(".input_fields_wrap"); //Fields wrapper
						var add_button = $(".add_field_button"); //Add button ID

						var y = 1;
						var x = 1; //initlal text box count
						$(add_button)
								.click(
										function(e) { //on add input button click
											e.preventDefault();
											if (x < max_fields) { //max input box allowed
												x++; //text box increment
												$(wrapper)
														.append(
																'<div><input type="text" name="moleculeAtom['+y+']"/><a href="#" class="remove_field">Remove</a></div>'); //add input box
												y++;
											}
										});

						$(wrapper).on("click", ".remove_field", function(e) { //user click on remove text
							e.preventDefault();
							$(this).parent('div').remove();
							x--;
							y--;	
						})
					});
</script>


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
			<h4 class="text-muted"><fmt:message key="updateMolecule" /></h4>
			<nav>
				<ul class="nav nav-justified">
					<li><a href="menu.jsp">Home</a></li>
					<li><a  href="createMolecule.jsp"><fmt:message key="createMolecule" /></a></li>
					<li><a  href="displayMoleculeConfirmation.jsp"><fmt:message key="displayMolecule" /></a></li>
	
					<li><a  href="about.jsp"><fmt:message key="about" /></a></li>
				</ul>
			</nav>
		</div>
	
		<div class="well">
			<form action="GUIServlet?action=update" method="POST">
				<div class="panel panel-default">

					<!-- Table -->
					<table class="table">
						<thead>
							<tr>
								<th>#</th>
								<th><fmt:message key="name" /></th>
								<th><fmt:message key="role" /></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row"></th>
								<td><input type="text" name="moleculeName" required ></td>
								<td><input type="text" name="moleculeRole" required ></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="panel panel-default">
					<!-- Table -->
					<table class="table">

						<tbody>
							<tr data-name="test">
								<th scope="row"><fmt:message key="atom" /></th>
								<td>

									<div class="input_fields_wrap">
										<button class="add_field_button">Add More Fields</button>
										<div>
											<input type="text" name="moleculeAtom[0]">
										</div>

									</div> 

								</td>
								

							</tr>
							<tr>
								<th scope="row"><fmt:message key="electron" /></th>
								<td><input type="text" name="moleculeElectron"></td>
							</tr>
							<tr>
								<th scope="row"><fmt:message key="bond" /></th>
								<td><input type="text" name="moleculeBond"></td>
							</tr>
						</tbody>
					</table>



				</div>
				
				<input type="submit" value="<fmt:message key="create" />">
			</form>

		</div>

		<br>
		<br>
		<p align="center">
		<img src="http://www.openschool.bc.ca/features/images/sc9/sc0931a_electrons_animated.gif">		
		</p>

		<!-- Site footer -->
		<footer class="footer">
			<p>&copy; ESIAG 2015</p>
		</footer>

	</div>
	<!-- /container -->


</body>
</html>