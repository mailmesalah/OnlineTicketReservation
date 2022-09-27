
<html>
<head>

</head>
<body>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%
try{

	Object un=session.getAttribute("username");
//	System.out.println(un);
	Object pw=session.getAttribute("password");

//	String usn=request.getParameter("username");
	String psw=request.getParameter("password");
//	String rpw=request.getParameter("rpassword");
	String adr=request.getParameter("address");
	String plc=request.getParameter("place");
	String pin=request.getParameter("pincode");
	String stt=request.getParameter("state");
	String dic=request.getParameter("district");
	String ema=request.getParameter("email");
	String sex=request.getParameter("sex");
	String age=request.getParameter("age");
	String dob=request.getParameter("dateofbirth");
	String thn=request.getParameter("theatername");
	String lcn=request.getParameter("licenceno");
	String mgs=request.getParameter("morningshow");
	String nns=request.getParameter("noonshow");
	String mts=request.getParameter("matneyshow");
	String fts=request.getParameter("firstshow");
	String scs=request.getParameter("secondshow");
	String bcs=request.getParameter("balconyseats");
	String scst=request.getParameter("secondclassseats");
	String ftst=request.getParameter("firstclassseats");
	String bcc=request.getParameter("balconycost");
	String scc=request.getParameter("secondclasscost");
	String fcc=request.getParameter("firstclasscost");

//out.println(un+" "+pw);
//connecting database
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:dsn","","");
	Statement stmt=con.createStatement();



//	int i=stmt.executeUpdate("update Accounts set Password='"+psw+"',TheaterName='"+thn+"',LicenceNo= "+lcn+",Age="+age+",Sex='"+sex+"',DateOfBirth="+dob+",MorningShow='"+mgs+"',NoonShow='"+nns+"',MatneyShow='"+mts+"',FirstShow='"+fts+"',SecondShow='"+scs+"',BalconySeats="+bcs+",SecondClassSeats="+scst+",FirstClassSeats="+ftst+",BalconyCost="+bcc+",SecondClassCost="+scc+",FirstClassCost="+fcc+",Email='"+ema+"',Address='"+adr+"',Place='"+plc+"',Pincode="+pin+",State='"+stt+"',District='"+dic+"',UName='"+"Sely"+"'  where Username='"+un+"' and Password='"+pw+"'");

	int i=stmt.executeUpdate("update Accounts set Password='"+psw+"',TheaterName='"+thn+"',LicenceNo= "+lcn+",Age="+age+",Sex='"+sex+"',DateOfBirth='"+dob+"',MorningShow='"+mgs+"',NoonShow='"+nns+"',MatneyShow='"+mts+"',FirstShow='"+fts+"',SecondShow='"+scs+"',BalconySeats="+bcs+",SecondClassSeats="+scst+",FirstClassSeats="+ftst+",BalconyCost="+bcc+",SecondClassCost="+scc+",FirstClassCost="+fcc+",Email='"+ema+"',Address='"+adr+"',Place='"+plc+"',Pincode="+pin+",State='"+stt+"',District='"+dic+"' where Username='"+un+"' and Password='"+pw+"'");
	session.setAttribute("password",psw);
	if(i>0){
	%><center><h1><font color= "Blue"> <%
		out.println("<h1>Successfully updated your account</h1>");
	%></center></h1></font><%
	}//if this block doesnt work there is problem related to the database is occured...
	

		

		
	

	stmt.close();
        con.close();

		
	

} catch(Exception e) {
%><center><h1><font color= "Blue"> <%
	out.println("<h1>Updation failed..</h1>");
%></center></h1></font><%
	System.out.println(e);
}
	
%>

<form name="form1"action="Account.jsp">
<center><input type="submit" value="Click here to see your account..."></center>

</body>
</html>