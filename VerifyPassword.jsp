<html>
<head>
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
	int tbn=Integer.parseInt(bln);
	String ftn=request.getParameter("firstno");
	int tfn=Integer.parseInt(ftn);
	String scn=request.getParameter("secondno");
	int tsn=Integer.parseInt(scn);
	
	//String temp=request.getParameter("cardno");
	Object temp = session.getAttribute("cardNo");
	String cdnStr = temp.toString();//Integer.parseInt(temp);
	int cdn = Integer.parseInt(cdnStr);

	String psd=request.getParameter("password");

//	java.sql.Date dat=java.sql.Date.valueOf(dt);




	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:dsn","","");
	Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	ResultSet rsa=stmt.executeQuery("select * from Accounts where TheaterName='"+th+"'");
	
	rsa.next();

	cdnStr=rsa.getString("BalconyCost");
	int bc=Integer.parseInt(cdnStr);
	cdnStr=rsa.getString("SecondClassCost");
	int sc=Integer.parseInt(cdnStr);
	cdnStr=rsa.getString("FirstClassCost");
	int fc=Integer.parseInt(cdnStr);
//////////////////////////total cost calculating

	bc=bc*tbn;
	sc=sc*tsn;
	fc=fc*tfn;
	int tc=bc+sc+fc;
	




System.out.println(bc+sc+fc);
//ResultSet rs=stmt.executeQuery("select * from CreditCard ");
	ResultSet rs=stmt.executeQuery("select * from CreditCard where CreditCardNo="+cdn+" and Password='"+psd+"'");
	if(rs.next()){

//////////////////////////////////////////////check amount and reduce it from credit card
///////////////////////////////database amount calculating

		cdnStr=rs.getString("Amount");
		int amt=Integer.parseInt(cdnStr);

	
System.out.println(amt);

		if(amt<tc){response.sendRedirect("NotReserved.jsp?status=1&theater="+th+"&place="+pl+"&show="+sh);}

		amt=amt-tc;
	
///stmt.executeUpdate("update CreditCard set Amount="+amt+" where CreditCardNo="+cdn);
//////////////////////////////create an algorithm for code creation

		/////////////code should be unique or error reports"General error"
	
		java.util.Date dat = new java.util.Date();
		String code = "CD"+(dat.getYear()+dat.getSeconds())+dat.getMonth()+dat.getDay()+dat.getHours()+dat.getMinutes()+dat.getSeconds();		
////****************//Encode code here
////****************//Checking of code in database may be needed for maintaine unique constraint	
		
//////////inserting date is not in correct
		stmt.executeUpdate("insert into Reservation (Dates,ShowTime,Code,BalconySeats,SecondClassSeats,FirstClassSeats)values('"+dt+"','"+sh+"','"+code+"',"+tbn+","+tsn+","+tfn+")");

//		stmt.executeUpdate("insert into Reservation (Dates,ShowTime,Code,BalconySeats,SecondClassSeats,FirstClassSeats)values(2/2/88,'"+sh+"',"+code+","+tbn+","+tsn+","+tfn+")");


//////////////////////////////////////////////////////////***************************++++++++++++++++++++
/*here  goes the updating of date table of each theaters taking in account of reserved seats in each section//////////////
/////////////////////////////
		stmt.executeUpdate("update CreditCard set Amount="+amt+" where CreditCardNo="+cdn);




+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
*///////////////////////////////////////////////
////////////////////////////////

		session.setAttribute("code",code);
		session.removeAttribute("cardNo");

		response.sendRedirect("Reserved.jsp");


	}
	else{

		response.sendRedirect("NotReserved.jsp?status=2&theater="+th+"&place="+pl+"&show="+sh);
	}



}
catch(Exception e){


	String th=request.getParameter("theater");

	String pl=request.getParameter("place");

	String sh=request.getParameter("show");
	%>
	<center>
	<h1>
	You Have To Reenter Your Credit Card !
	</h1>
	<%
	out.println("<a href = \"ReserveDate.jsp?theater="+th+"&place="+pl+"&show="+sh+"\">Click here to Enter your credit card</a>");
	
	%>
	<form name="from4"action="Home.jsp">
	<input type="submit" value="Home Page">
	</form>
	</center>
	<%
	System.out.println(e);

	System.out.println(th+sh+pl);

}

%>


</body>
</html>