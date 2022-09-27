<html>
<head>
</head>

<body>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%

try{

	String id=request.getParameter("id");
	

/*	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:dsn","","");
	Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);


	ResultSet rs=stmt.executeQuery("select * from Accounts ");
	rs.next();

*/
//////////////////////////////////////////////////////////
%>

<center><h1><font color = "green+blue"><b>Your code is invalid ...!</b></font></h1>

<form name="form1" action="ValidateTickets.jsp" method="post">

<%
out.println("<input type=\"hidden\" name=\"id\" value=\""+id+"\">");
%>

<input type="submit" value="Click here to Search again!">
</form>

<form name="form2" action="SignOut.jsp" method="post">


<input type="submit" value="Sign out">
</form></center>
<%
////////////////////////////////////////////////////////////
}
catch(Exception e){

	System.out.println(e);


}

%>




</body>
</html>