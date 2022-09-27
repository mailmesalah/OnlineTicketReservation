<html>
<head>
</head>

<body>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%

try{


	out.println("<font color=\"red\" ><h1 align=\"center\">Licence validation failed  !</h1></font>");

	out.println("<center><a href=\"Home.jsp\">Click here to go home.</a>");

}
catch(Exception e){

	System.out.println(e);


}

%>


</body>
</html>