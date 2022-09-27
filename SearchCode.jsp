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
	String code=request.getParameter("code");

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:dsn","","");
	Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);


	ResultSet rs=stmt.executeQuery("select * from Reservation where Code= '"+code+"'");
	if(!(rs.next())){


		response.sendRedirect("WrongCode.jsp?id="+id);
	}
	
//////////////////////////////////////////////////////////////////Searching code


	String dts=rs.getString(2);
	String st=rs.getString(3);
	String cd=rs.getString(4);
	String bs=rs.getString(5);
	String scs=rs.getString(6);
	String fcs=rs.getString(7);

//////////////////////////////////////////////////////////////////
%>
<form name="form1" action="ValidateTickets.jsp" method="post">
<h1 align = "center">
Code is Valid
</h1>
<fieldset>
<legend>
<font color = "orange"><b>
<font size = "3">
	Reservation Details
</font></b>
</font>
</legend>
<pre>

<%
out.println(" <br><b> Date:</b>  "+dts);
out.println(" <br><b> Show Time:</b>  "+st);
out.println(" <br><b> Code:</b>  "+cd);
out.println(" <br><b> Balcony seats reserved:</b>  "+bs);
out.println(" <br><b> Second Class seats reserved:</b>  "+scs);
out.println(" <br><b> First Class seats reserved:</b>  "+fcs+"<br><br>");

%>

</fieldset>

<br><br>
<center><input type="submit" value=" Next Search "></center>
</form>
<%
System.out.println("hello");
}
catch(Exception e){

	System.out.println(e);


}

%>


</body>
</html>