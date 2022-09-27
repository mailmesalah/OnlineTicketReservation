<html>
<head>
</head>

<body>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%

try{

////////////////////create a search box here

/////////////////////font may be used
	String dat=request.getParameter("data");

%><h1 align = "center"><%
	out.println("<font color = \"Red\">No Search Result For   \" "+dat+" \"</font>");
%></h1>
<form name="form1" action="SearchSelection.jsp" method="post">
	
<center><input type="submit" value=" Click here for the next try! ">
</center></form>
<%


} catch(Exception e) {
	System.out.println(e);
}


%>
</body>
</html>