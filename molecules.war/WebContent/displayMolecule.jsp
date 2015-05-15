<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.xml_cml.schema.cml2.core.Molecule"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.PrintWriter"%>
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

<title>Dancing Electron Display Molecule</title>

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
			<h4 class="text-muted"><fmt:message key="displayMolecule" /></h4>
			<nav>
				<ul class="nav nav-justified">
					<li><a href="menu.jsp">Home</a></li>
					<li><label for="createMolecule"><a href="createMolecule.jsp"><fmt:message key="createMolecule" /></a></label></li>
					<li><label for="displayMolecule"><a href="displayMoleculeConfirmation.jsp"><fmt:message key="displayMolecule" /></a></label></li>
	
					<li><label for="about"><a href="about.jsp"><fmt:message key="about" /></a></label></li>
				</ul>
			</nav>
		</div>
		<div class="well">

			<!-- List of molecules here -->
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading"><fmt:message key="titleTab" /></div>

				<!-- Table -->
				<!-- 	<table>
					<c:forEach items="${TAREWEIGHT}" var="tareWeight" varStatus="loop">
						<c:set var="barCode" value="${BARCODE[loop.index]}" />
						<tr>
							<td><c:out value="${tareWeight}" /></td>
							<td><c:out value="${barCode}" /></td>
						</tr>
					</c:forEach>
				</table> -->
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th><fmt:message key="name" /></th>
							<th><fmt:message key="role" /></th>
							
						</tr>
					</thead>
					<tbody>
						<%
							//List<Molecule> myMolecule = (List<Molecule>) request.getAttribute("molecules");
							//for (int i = 0; i < myMolecule.size(); i++) {
								//Molecule molecule = myMolecule.get(i);
								//int nb = i+1;
								//out.println("<tr><td>" + nb + "</td><td>" + molecule.getTitle()
									//	+ "</td><td>" + molecule.getRole() + "</td></tr>");
							//}
						%>
						
						<!-- Site footer -->
						<tr><td>1</td><td>Water</td><td>Life</td>
						
						<td>
							<form action="GUIServlet?action=update" method="POST">
								<input type="submit" value="<fmt:message key="update" />">
							</form>
						</td>
						
						<td>
							<form action="GUIServlet?action=delete" method="POST">
								<input type="submit" value="<fmt:message key="delete" />">
							</form>
						</td></tr>
					</tbody>
				</table>
			</div>

		</div>

		<!-- Site footer -->
		<footer class="footer">
			<p>&copy; ESIAG 2015</p>
		</footer>

	</div>
	<!-- /container -->


</body>
</html>