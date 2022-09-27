<html>
<head>
</head>

<body>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>

<%
try{

	String th=request.getParameter("theater");////if null page is directly called
//connecting database
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:dsn","","");
	Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);


	ResultSet rs=stmt.executeQuery("select * from Accounts where TheaterName='"+th+"'");
	ResultSetMetaData rsmd=rs.getMetaData();
	rs.next();
System.out.println(th);
	%>
	<h1 align = "center">
	<font color = "Orange&Red">
	<%
	out.println(""+th+"");
	%>
	</h1>
	</font>
	<%
	%>
	<h3 align = "center">
	<font color = "Red&Orange">
	<%
	
	
	String pl=rs.getString("Place");


	out.println("<b>"+pl);
%>
	</h1>
	</font>
	<%

/////////////////show times
	int i=5;
	String sht[]=new String[i];

	//checking can be done here
	sht[0]=rsmd.getColumnLabel(9);
System.out.println(sht[0]);
	sht[1]=rsmd.getColumnLabel(10);
System.out.println(sht[1]);
	sht[2]=rsmd.getColumnLabel(11);
System.out.println(sht[2]);
	sht[3]=rsmd.getColumnLabel(12);
System.out.println(sht[3]);
	sht[4]=rsmd.getColumnLabel(13);
System.out.println(sht[4]);


/////////////////seats
	i=3;
	String sts[]=new String[i];
	
	//checking can be done here
	sts[0]=rsmd.getColumnLabel(14);
//System.out.println(sts[0]);
	sts[1]=rsmd.getColumnLabel(15);
//System.out.println(sts[1]);
	sts[2]=rsmd.getColumnLabel(16);
//System.out.println(sts[2]);


////////////////films
	i=5;
	String flm[]=new String[i];
	//checking can be done here
	flm[0]=rs.getString(9);
//System.out.println(flm[0]);
	flm[1]=rs.getString(10);
//System.out.println(flm[1]);
	flm[2]=rs.getString(11);
//System.out.println(flm[2]);
	flm[3]=rs.getString(12);
//System.out.println(flm[3]);
	flm[4]=rs.getString(13);
//System.out.println(flm[4]);

////////////////seatcost

	i=3;
	String stc[]=new String[i];
	
	//checking can be done here
	stc[0]=rs.getString(14);
//System.out.println(stc[0]);
	stc[1]=rs.getString(15);
//System.out.println(stc[1]);
	stc[2]=rs.getString(16);
//System.out.println(stc[2]);

%>


<form name="form1" action="Reserving.jsp" method="post">

	<Fieldset>
	<pre>
	<legend>
	<font color="DarkYellow">
	Show and Films
	</font>
	</legend>
<%

	out.println(" ");
	for(i=0;i<5;i++){

		out.println("<a href=\"ReserveDate.jsp?show="+sht[i]+"&theater="+th+"&place="+pl+"\">"+(i+1)+". "+sht[i]+" : "+flm[i]+" </a><br><br>");
	}
%>
	</pre>
	</Fieldset>


</form>






<%

}catch(Exception e){System.out.println(e);}


%>
</body>
</html>