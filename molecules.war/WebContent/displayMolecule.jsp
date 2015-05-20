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
 <script type="text/javascript">
        // Function for storing to cookie
        function setCookie(c_name,value,exdays)
        {
            var exdate=new Date();
            exdate.setDate(exdate.getDate() + exdays);
            var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
            document.cookie=c_name + "=" + c_value;
        }

        // Called on form's `onsubmit`
        function tosubmit() {
            // Getting the value of your text input
            var mytext = document.getElementById("mytext").value;

            // Storing the value above into a cookie
            setCookie("mytext", mytext, 300);

            return true;
        }

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
							List<Molecule> myMolecule = (List<Molecule>) request.getAttribute("molecules");
							for (int i = 0; i < myMolecule.size(); i++) {
								Molecule molecule = myMolecule.get(i);
								int nb = i+1;
								out.println("<tr>");
								out.println("<td>" + nb + "</td><td>" + molecule.getTitle()+ "</td><td>" + molecule.getRole() + "</td></tr>");
								out.println("<td><form method='get'> action='upadteMolecule.jsp'");
								out.println("<input type='hidden' name='"+ molecule.getId()+"' value='"+molecule.getId()+"'");
								out.println("<input type='hidden' name='"+ molecule.getTitle()+"' value='"+molecule.getTitle()+"'");
								out.println("<input type='hidden' name='"+ molecule.getRole()+"' value='"+molecule.getRole()+"'");
								out.println("<input type='hidden' name='"+ molecule.getAtomArray()+"' value='"+molecule.getAtomArray()+"'");
								out.println("<input type='hidden' name='"+ molecule.getElectron()+"' value='"+molecule.getElectron()+"'");
								out.println("<input type='hidden' name='"+ molecule.getBondArray()+"' value='"+molecule.getBondArray()+"'");			
								out.println("<input type='submit' value='Update'>");
								out.println("</form></td>");
								
								out.println("<td><form method='POST'> action='GUIServlet?action=delete'");
								out.println("<input type='hidden' name='"+ molecule.getId()+"' value='"+molecule.getId()+"'");
								out.println("<input type='submit' value='Delete'>");
								out.println("</form></td>");		
								out.println("</tr>");
							}
						%>
						
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