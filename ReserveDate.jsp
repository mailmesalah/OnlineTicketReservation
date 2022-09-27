<html>
<head>

</head>
<body>

<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%
try{

	String th=request.getParameter("theater");

	String pl=request.getParameter("place");

	String sh=request.getParameter("show");

//out.println("happy"+th+" "+pl+" "+sh);

	

//connecting database
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:dsn","","");
	Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);


	ResultSet rs=stmt.executeQuery("select * from Accounts where TheaterName = '"+th+"' and Place = '"+pl+"' ");
	ResultSetMetaData rsmd=rs.getMetaData();

	rs.next();
////////////////////////////////////////////////////

	String fl=rs.getString(sh);
	%>
	<h1 align = "center"><font color="Orang&Red">

	<%
	out.println(""+th+"");///////////////use table to make the name only as bold
	%>
	</font></h1>
	<h3 align = "center"><font color="#32CD32">
	<%
	out.println(pl);///////////////use table to make the name only as bold
	%>
	</font></h1>
	<fieldset>
	<pre>
	
	<legend><b><font color="DarkOrange">
	<%
	out.println("<b><br>Show time and Film :</b><br><br> <font color = \"DarkGreen\"></b></legend><br><br> "+sh+" : "+fl+"</b>");///////////////use table to make the name only as bold
	//out.println(" ");
	%></pre>
	</b></font>
	<%
///////////////////////////sets current date to 7 days

	Calendar cal=Calendar.getInstance();
	Calendar cltmp=Calendar.getInstance();

	cltmp.add(Calendar.DATE,7);

	int crdat=cal.get(Calendar.DATE);
	int crmth=cal.get(Calendar.MONTH);
	crmth = crmth+1;
//System.out.println(crmth);
	int cryer=cal.get(Calendar.YEAR);

	int tmdat=cltmp.get(Calendar.DATE);
	int tmmth=cltmp.get(Calendar.MONTH);
	tmmth = tmmth+1;
	int tmyer=cltmp.get(Calendar.YEAR);	
%>




<form name="form1" action="Reserving.jsp" method="post">

<%

out.println("<input type=\"hidden\" name=\"theater\" value=\""+th+"\">");
out.println("<input type=\"hidden\" name=\"place\" value=\""+pl+"\">");
out.println("<input type=\"hidden\" name=\"show\" value=\""+sh+"\">");

%>
<pre></font><font color = "DarkGreen">
</b> Select Date : </b></font><select name="day">
<%
	for(int i=crdat;i<tmdat;++i){

	out.println("<option value=\""+i+"\">"+i+"</option>");
	}
%>
</select>-<select name="month">
<%

	for(int i=crmth;i<=tmmth;++i){

	out.println("<option value=\""+i+"\">"+i+"</option>");
	}
%>
</select>-<select name="year">//////////////select todays date till 10 days
<%
	for(int i=cryer;i<=tmyer;++i){

	out.println("<option value=\""+i+"\">"+i+"</option>");
	}
%>
</select>


<center><input type="submit" value=" Submit "></center>
</fieldset>
</form>

<%
///////////////////////////
}
catch(Exception e){System.out.println(e);}
	
%>
</body>
</html>