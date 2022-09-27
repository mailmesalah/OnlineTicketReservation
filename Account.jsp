<html>
<head>


</head>
<body>
<script>
function signout(){
window.location="SignOut.jsp";
}
</script>

<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%
try{

	Object un=session.getAttribute("username");
//	System.out.println(un);
	Object pw=session.getAttribute("password");
//out.println(un+" "+pw);
//connecting database
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:dsn","","");
	Statement stmt=con.createStatement();

	
	ResultSet rs=stmt.executeQuery("select * from Accounts where Username='"+un+"' and Password='"+pw+"'");
		
	if(!rs.next()){response.sendRedirect("SignInWrong.jsp");}
	
	String st[]=new String[26];
		
	for(int i=1;i<=26;++i){
		st[i-1]=rs.getString(i);
	}

	%><Font color="#0000FF">
	<h1>
	<CENTER><%
	out.println("<h3>Hello "+st[25]+",</h3>");// use table for setting only name in bold 
	%></center>
	</h1>
	</font>

	<Fieldset>
	<pre>
	<legend>
	<font color="#EC153C"><u><%
	out.println("Your Details are... ");
	%></u></font>
	</legend><b><font size = "3">
	
	<%
	out.println("<br><br> Username      : "+st[1]);
	out.println("<br> Address       : "+st[20]);
	out.println("<br> Place         : "+st[21]);
	out.println("<br> Pincode       : "+st[22]);
	out.println("<br> State         : "+st[23]);
	out.println("<br> Distric       : "+st[24]);
	out.println("<br> Email         : "+st[19]);
	out.println("<br> Sex           : "+st[6]);
	out.println("<br> Age           : "+st[5]);
	out.println("<br> Date of birth : "+st[7]);
	%>

	</fieldset>
	
	<Fieldset>
	<pre>
	<legend>
	<font color="#EC153C"><u>
	Your Theater Details are...
	</u></font>
	</legend>
	<font color = "greenlime">
	<font size = "3">
      <%
	out.println("<br> Theater Name : "+st[3]);
	out.println("<br> Licence No   : "+st[4]+"<br>");

	out.println("<br> Morning Show : "+st[8]);
	out.println("<br> Noon Show    : "+st[9]);
	out.println("<br> Matney Show  : "+st[10]);
	out.println("<br> First Show   : "+st[11]);
	out.println("<br> Second Show  : "+st[12]+"<br>");
	
	out.println("<br> Balcony Seats      : "+st[13]);
	out.println("<br> Second Class Seats : "+st[14]);
	out.println("<br> First Class Seats  : "+st[15]+"<br>");
	
	out.println("<br> Balcony Cost      : "+st[16]);
	out.println("<br> Second Class Cost : "+st[17]);
	out.println("<br> First Class cost  : "+st[18]);

%>
	</pre>
	</font>
	</fieldset>
<form name="from1"action="UpdateAccount.jsp">
<center><input type="submit" value="Update">
</form>
<form name="from2"action="SignOut.jsp">
<input type="button" value="Sign out"onClick="signout()">
</form>
<form name="from3"action="ValidateTickets.jsp" method="post">
<%
out.println("<input type=\"hidden\" name=\"id\" value=\""+st[0]+"\">");
%>
<input type="submit" value="Tickets">
</form>
<form name="from4"action="Home.jsp">
<input type="submit" value="Home Page">
</form>
	
</center>
<%	

	
	rs.close();
	stmt.close();
        con.close();



} catch(Exception e) {
	System.out.println(e);
}
	
%>


</body>
</html>