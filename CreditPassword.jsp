<html>
<head>
<script>

/////////////////////

function check(){/////fill all boxes

		

	 for(var i=0;i<document.form1.elements.length;i++){
		
//alert(document.form1.elements[i].value);

	 	if(document.form1.elements[i].value==""){
		
			window.alert("Please enter the password.");
			
			return false;
			
		}

		
	 }

	return true;
		
	
}


//////////////////

</script>

</head>

<body>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%

try{

	String th=request.getParameter("theater");

	String pl=request.getParameter("place");

	String sh=request.getParameter("show");

	String dt=request.getParameter("date");

	String bln=request.getParameter("balconyno");

	String ftn=request.getParameter("firstno");

	String scn=request.getParameter("secondno");

	String cdn=request.getParameter("cardno");

	session.setAttribute("cardNo",cdn);
/*
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:dsn","","");
	Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);


	ResultSet rs=stmt.executeQuery("select * from Accounts ");
	rs.next();
//	System.out.println(rs.getString("ID"));
	
	String id=rs.getString("ID");
*/
%>
<form name="form1" action="VerifyPassword.jsp" method="post" onSubmit="return check();">

<%

out.println("<input type=\"hidden\" name=\"theater\" value=\""+th+"\">");
out.println("<input type=\"hidden\" name=\"place\" value=\""+pl+"\">");
out.println("<input type=\"hidden\" name=\"show\" value=\""+sh+"\">");
out.println("<input type=\"hidden\" name=\"date\" value=\""+dt+"\">");
out.println("<input type=\"hidden\" name=\"balconyno\" value=\""+bln+"\">");
out.println("<input type=\"hidden\" name=\"secondno\" value=\""+scn+"\">");
out.println("<input type=\"hidden\" name=\"firstno\" value=\""+ftn+"\">");
//out.println("<input type=\"hidden\" name=\"cardno\" value=\""+cdn+"\">");
%>

<h1 align = "center">
<font color = "Lime">
	Confirm
</font>
</h1>
<fieldset>
<pre>

<legend><b>
Creadit card Details
</legend></b>

 Enter password: <input type="password" name="password"><br><br>
		
		     <center><input type="submit" value="Submit">
</pre>
</fieldset>
</form>
<%

}
catch(Exception e){

	System.out.println(e);


}

%>


</body>
</html>