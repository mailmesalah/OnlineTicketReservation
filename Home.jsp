<html>
<head>
<center>

<h1><font color="#32CD32"><b><u>Online Reservation</font></h1><font color="#FF0000"><b>for theaters...</u></b></font>

<script>

function register(){

	window.location="Register.jsp";
}
function reserve(){

	window.location="SearchSelection.jsp";
}

</script>
</head>
<pre>
<body>
<fieldset>
<legend>
Your Choice
</legend>

<form name="from1" action="SignIn.jsp">
<input type="button" value="Register"onClick="register()"><br><br>
<input type="button" value="Reserve tickets"onClick="reserve()"><br><br>
<input type="submit" value=" Sign in "><br><br>

</fieldset>
</pre>

</center>

<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%

try{

/*


	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:dsn","","");
	Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

	
//////////// Create a calendar initialized with the
////////// current date and time in the default
//////////// locale and timezone.

	Calendar cal=Calendar.getInstance();

	int d=cal.get(Calendar.DATE);


	int rlen=0;
	ResultSet rs=stmt.executeQuery("select * from Accounts ");
	while(rs.next()){

		rlen++;
	}
	
	String id[]=new String[rlen];

	rs.beforeFirst();


	int i=0;
	
	while(rs.next()){

	
		id[i]=rs.getString("ID");
		i++;
	}

	rs=stmt.executeQuery("select * from Date"+id[0]);
	
	String temp=rs.getString("Dates");

	
	StringTokenizer stk=new StringTokenizer(temp,"/");

	int ien=stk.countTokens();
	
	String st[]=new String[len];

	i=0;	
	while(stk.hasMoreTokens()){

		st[i]=stk.nextToken();

		i++;
	}

	int day=Integer.parseInt(st[0]);

	if(day!=d){////date is different

		len=d-day;
	
////////////////////////////////////////delete the previous days

		for(i=0;i<rlen;i++){

			for(int j=0;j<len;j++){
			
				stmt.exequteUpdate("delete from Date"+st[i]+" where Dates='"+day+"'");
				day=day+1;



			}




		}


/////////////////////////////////////////inserting new dates


		for(i=0;i<rlen;i++){

			for(int j=0;j<len;j++){
			
				stmt.exequteUpdate("insert into Date"+st[i]+" values('"++"',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)");
				day=day+1;



			}




		}




///////////////////////////////////////////////////////

	}



///////////////////////////////////////////////////////


*/


}
catch(Exception e){

	System.out.println(e);


}

%>




</body>
</html>