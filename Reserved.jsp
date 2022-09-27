<html>
<head>
</head>

<body>
<font color="blue">
<center>
<h1>Hello you have successfully reserved your seats...</h1></font>
<font color="Darkviolet">
<%@page import="java.io.*" %>
<%

try{



	Object code=session.getAttribute("code");

	out.println("<b>Please take down your code:<b><br><br>");
	%>
	<font color = "Red"><b><h3>
	<%
	out.println("<b> "+code+" <b><br><br><br>");
	%>
	</b></h3>


	<%
	out.println("<a href=\"Home.jsp\">Click here to go Homepage</a>");


}
catch(Exception e){

	System.out.println(e);
}
%>
</body>
</html>