<html>
<head>

</head>
<body>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<%
try{

	String un=request.getParameter("username");
	String pw=request.getParameter("password");
	un=un.trim();
	
	session.setAttribute("username",un);
	session.setAttribute("password",pw);

//out.println(un+" "+pw);
//connecting database
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:dsn","","");
	Statement stmt=con.createStatement();

//	String st=new String();



	ResultSet rs=stmt.executeQuery("select * from Accounts where Username='"+un+"' and Password='"+pw+"'");
		
	if(!rs.next()){
		response.sendRedirect("SignInWrong.jsp");
	}
	else{
		response.sendRedirect("Account.jsp");
		
	}
	
	rs.close();
	stmt.close();
        con.close();



} catch(Exception e) {
	System.out.println(e);
}
	
%>
</body>
</html>