<html>
<head>
</head>

<body>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%

try{


	String flms=request.getParameter("filmname");
//out.println(flms);
////////////////////create a search box here

/////////////////////font may be used

	out.println("<h1 align=\"center\"> <font color = \"Red\">No Search Result For   &nbsp\" "+flms+" \"</h1>");
%>
<form name="form1" action="SearchSelection.jsp" method="post">
	
<center><input type="submit" value=" Click here for the next try! ">
</form>
<%


} catch(Exception e) {
	System.out.println(e);
}


%>
</body>
</html>