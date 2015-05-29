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

<title>Dancing Electron Create Molecule</title>

<link href="CSS/bootstrap.min.css" rel="stylesheet">
<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
<link href="CSS/styles.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script>
	$(document).ready(
					function() {
						var max_atom = 10; //maximum input boxes allowed
						var max_electron = 10; //maximum input boxes allowed
						var max_bond = 10; //maximum input boxes allowed
						var atom = $(".input_fields_atom"); //Fields wrapper
						var electron = $(".input_fields_electron"); //Fields wrapper
						var bond = $(".input_fields_bond"); //Fields wrapper
						
						var add_button_atom = $(".add_field_button_atom"); //Add button ID
						var add_button_electron = $(".add_field_button_electron"); //Add button ID
						var add_button_bond = $(".add_field_button_bond"); //Add button ID

						var yAtom = 1;
						var xAtom = 1; //initlal text box count
						var yElectron = 1;
						var xElectron = 1; //initlal text box count
						var yBond = 1;
						var xBond = 1; //initlal text box count
						$(add_button_atom).click(
										function(e) { //on add input button click
											e.preventDefault();
											if (xAtom < max_atom) { //max input box allowed
												xAtom++; //text box increment
												$(atom).append(
																'<div><input type="text" name="moleculeAtom"/><a href="#" class="remove_field">X</a></div>'); //add input box
												yAtom++;
											}
										});
						$(add_button_electron).click(
								function(e) { //on add input button click
									e.preventDefault();
									if (xElectron < max_electron) { //max input box allowed
										xElectron++; //text box increment
										$(electron).append(
														'<div><input type="text" name="moleculeElectron"/><a href="#" class="remove_field">X</a></div>'); //add input box
										yElectron++;
									}
								});
						$(add_button_bond).click(
								function(e) { //on add input button click
									e.preventDefault();
									if (xBond < max_bond) { //max input box allowed
										xBond++; //text box increment
										$(bond).append(
														'<div><input type="text" name="moleculeBond"/><a href="#" class="remove_field">X</a></div>'); //add input box
										yBond++;
									}
								});

						$(atom).on("click", ".remove_field", function(e) { //user click on remove text
							e.preventDefault();
							$(this).parent('div').remove();
							xAtom--;
							yAtom--;	
						});
						$(electron).on("click", ".remove_field", function(e) { //user click on remove text
							e.preventDefault();
							$(this).parent('div').remove();
							xElectron--;
							yElectron--;	
						});
						$(bond).on("click", ".remove_field", function(e) { //user click on remove text
							e.preventDefault();
							$(this).parent('div').remove();
							xBond--;
							yBond--;	
						});
					}	
	);
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
			<h4 class="text-muted"><fmt:message key="createMolecule" /></h4>
			<nav>
				<ul class="nav nav-justified">
					<li><a href="menu.jsp">Home</a></li>
					<li><a  href="#"><fmt:message key="createMolecule" /></a></li>
					<li><a  href="displayMoleculeConfirmation.jsp"><fmt:message key="displayMolecule" /></a></li>
	
					<li><a  href="about.jsp"><fmt:message key="about" /></a></li>
				</ul>
			</nav>
		</div>

		<div class="well">
			<form action="GUIServlet?action=creation" method="POST">
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

									<div class="input_fields_atom">
										<button class="add_field_button_atom"><fmt:message key="addAtom" /></button>
										<div>
											<input type="text" name="moleculeAtom">
										</div>

									</div> 

								</td>
								

							</tr>
							<tr>
								<th scope="row"><fmt:message key="electron" /></th>
								<td>
									<div class="input_fields_electron">
										<button class="add_field_button_electron"><fmt:message key="addElectron" /></button>
										<div>
											<input type="text" name="moleculeElectron">
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th scope="row"><fmt:message key="bond" /></th>
								<td>
									<div class="input_fields_bond">
										<button class="add_field_button_bond"><fmt:message key="addBond" /></button>
										<div>
											<input type="text" name="moleculeBond">
										</div>
									</div>
								</td>
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