<%@page import="org.apache.activemq.store.jdbc.adapter.MySqlJDBCAdapter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.xml_cml.schema.cml2.core.Molecule"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
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
					<li><a  href="createMolecule.jsp"><fmt:message key="createMolecule" /></a></li>
					<li><a  href="displayMoleculeConfirmation.jsp"><fmt:message key="displayMolecule" /></a></li>
	
					<li><a  href="about.jsp"><fmt:message key="about" /></a></li>
				</ul>
			</nav>
		</div>
		<div class="well">
		<div class="panel panel-default">
			<div class="panel-heading">
				<form action="GUIServlet?action=redo" method="POST">
					<input type="submit" value="<fmt:message key="redo" />" class="pull-right">
				</form>
					<form action="GUIServlet?action=undo" method="POST">
					<input type="submit" value="<fmt:message key="undo" />" class="pull-right">				
				</form>
				<h4>Last actions</h4>
			</div>
			<div class="panel-body">
			
				<hr>
		
			</div>
		</div>
		</div>
		<div class="well">
			<!-- List of molecules here -->
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading"><fmt:message key="titleTab" /></div>

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
						<%
							// pour tester
							Molecule mol1 = new Molecule();
							Molecule mol2 = new Molecule();
							List<Molecule> myMolecule = new ArrayList<Molecule>();
							myMolecule.add(0, mol1);
							myMolecule.add(1, mol2);
							//fin test
							//List<Molecule> myMolecule = (List<Molecule>) request.getAttribute("molecules");
							for (int i = 0; i < myMolecule.size(); i++) {
								Molecule molecule = myMolecule.get(i);
								int nb = i+1;
								out.println("<tr>");
								out.println("<td>" + nb + "</td><td>" + molecule.getTitle()+ "</td><td>" + molecule.getRole() + "</td>");
								out.println("<td><form method='GET' action='updateMolecule.jsp'></td>");
								out.println("<td><input type='hidden' name='"+ molecule.getId()+"' value='"+molecule.getId()+"'</td>");
								out.println("<td><input type='hidden' name='"+ molecule.getTitle()+"' value='"+molecule.getTitle()+"'</td>");
								out.println("<td><input type='hidden' name='"+ molecule.getRole()+"' value='"+molecule.getRole()+"'</td>");
								out.println("<td><input type='hidden' name='"+ molecule.getAtomArray()+"' value='"+molecule.getAtomArray()+"'</td>");
								out.println("<td><input type='hidden' name='"+ molecule.getElectron()+"' value='"+molecule.getElectron()+"'</td>");
								out.println("<td><input type='hidden' name='"+ molecule.getBondArray()+"' value='"+molecule.getBondArray()+"'</td>");
								out.println("<td><input type='image' id='updateImage' style='height:25px;width:25px;' src='http://cdn.flaticon.com/png/256/27869.png' /></td>");				
								out.println("<td></form></td>");
								
								out.println("<td><form method='POST' action='GUIServlet?action=delete'></td>");
								out.println("<td><input type='hidden' name='"+ molecule.getId()+"' value='"+molecule.getId()+"'</td>");
								out.println("<td><input type='image' id='deleteImage' style='height:25px;width:25px;' src='http://png-4.findicons.com/files/icons/1580/devine_icons_part_2/128/trash_recyclebin_empty_closed.png' /></td>");
								out.println("<td></form></td>");		
								out.println("</tr>");
							}
						%>
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