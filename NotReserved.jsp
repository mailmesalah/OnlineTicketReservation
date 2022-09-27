<html>
<head>
</head>

<body>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%

try{

	String status=request.getParameter("status");
	String sh=request.getParameter("show");
	String pl=request.getParameter("place");
	String th=request.getParameter("theater");
	String dt=request.getParameter("date");

%>
<form name="form1">


<%

	


	if(status.equals("1")){

		out.println("<b>You have a low balance!</b><br><br>");
		out.println("<a href=\"ReserveDate.jsp?theater="+th+"&place="+pl+"&show="+sh+"\">Click here to try again</a>");


	}
	else{

		%>
		<center>
		<%
		out.println("<b>Your Credit card details are wrong ! try again...<b><br><br>");
		out.println("<a href=\"ReserveDate.jsp?theater="+th+"&place="+pl+"&show="+sh+"\">Click here to try again</a>");
	
	}




}
catch(Exception e){

	System.out.println(e);


}

%>


</body>
</html>