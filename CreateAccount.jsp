<html>
<head>

</head>
<body>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%
try{

	String un=request.getParameter("username");
	un.toLowerCase();
	String usn=request.getParameter("username");
	usn.toLowerCase();
	String psw=request.getParameter("password");
	psw.toLowerCase();
//	String rpw=request.getParameter("rpassword");
	String adr=request.getParameter("address");
	adr.toLowerCase();
	String plc=request.getParameter("place");
	plc.toLowerCase();
	String pin=request.getParameter("pincode");

	String stt=request.getParameter("state");
	stt.toLowerCase();
	String dic=request.getParameter("district");
	dic.toLowerCase();
	String ema=request.getParameter("email");
	ema.toLowerCase();
	String sex=request.getParameter("sex");
	sex.toLowerCase();
	String age=request.getParameter("age");

	String day=request.getParameter("day");

	String mth=request.getParameter("mth");

	String yer=request.getParameter("yer");

	String thn=request.getParameter("theatername");
	thn.toLowerCase();
	String lcn=request.getParameter("licenceno");
	
	String mgs=request.getParameter("morningshow");
	mgs.toLowerCase();
	String nns=request.getParameter("noonshow");
	nns.toLowerCase();
	String mts=request.getParameter("matneyshow");
	mts.toLowerCase();
	String fts=request.getParameter("firstshow");
	fts.toLowerCase();
	String scs=request.getParameter("secondshow");
	scs.toLowerCase();
	String bcs=request.getParameter("balconyseats");

	String scst=request.getParameter("secondclassseats");

	String ftst=request.getParameter("firstclassseats");

	String bcc=request.getParameter("balconycost");

	String scc=request.getParameter("secondclasscost");

	String fcc=request.getParameter("firstclasscost");


System.out.println(fcc);

	String dob= new String();
	dob=day+"/"+mth+"/"+yer+"/";


////////////////////

/*should be considered for keeping username and password
	session.setAttribute("username",un);
	session.setAttribute("password"psw);
*/

//connecting database
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:dsn","","");
	Statement stmt=con.createStatement();

////////////////////////////////////////////////////////////////licence validation

	ResultSet rsd=stmt.executeQuery("select * from Licence where LicenceNo='"+lcn+"' and TheaterName='"+thn+"'");

	if(!rsd.next()){

		response.sendRedirect("InvalidRegistration.jsp");

	}

	

/////////////////////////////if any error catch deals with it like same username

//	int i=stmt.executeUpdate("insert into Accounts (Username,UName,Password,TheaterName,LicenceNo,Age,Sex,DateOfBirth,MorningShow,NoonShow,MatneyShow,FirstShow,SecondShow,BalconySeats,SecondClassSeats,FirstClassSeats,BalconyCost,SecondClassCost,FirstClassCost,Email,Address,Place,Pincode,State,District)values('"+un+"','"+usn+"','"+psw+"','"+thn+"','"+lcn+"',"+age+",'"+sex+"',"+dob+",'"+mgs+"','"+nns+"','"+mts+"','"+fts+"','"+scs+"',"+bcs+","+scst+","+ftst+","+bcc+","+scc+","+fcc+",'"+ema+"','"+adr+"','"+plc+"',"+pin+",'"+stt+"','"+dic+"')");
	int i=stmt.executeUpdate("insert into Accounts (Username,UName,Password,TheaterName,LicenceNo,Age,Sex,DateOfBirth,MorningShow,NoonShow,MatneyShow,FirstShow,SecondShow,BalconySeats,SecondClassSeats,FirstClassSeats,BalconyCost,SecondClassCost,FirstClassCost,Email,Address,Place,Pincode,State,District)values('"+un+"','"+usn+"','"+psw+"','"+thn+"','"+lcn+"',"+age+",'"+sex+"','"+dob+"','"+mgs+"','"+nns+"','"+mts+"','"+fts+"','"+scs+"',"+bcs+","+scst+","+ftst+","+bcc+","+scc+","+fcc+",'"+ema+"','"+adr+"','"+plc+"',"+pin+",'"+stt+"','"+dic+"')");
	
	if(i==1){
		session.setAttribute("password",psw);////identifying user
		session.setAttribute("username",un);
////////////////////////////////create date table for reservation




		ResultSet rs=stmt.executeQuery("select * from Accounts where Username='"+un+"'");
		
		rs.next();
		String id=rs.getString("ID");

//		stmt.executeUpdate("create table Date"+id+" (Dates varchar(10),MorningShow integer(8),NoonShow integer(8),MatneyShow integer(8),FirstShow integer(8),SecondShow integer(8) )");


		stmt.executeUpdate("create table Date"+id+" (Dates varchar(10) not null,MorningBalconySeats integer,MorningFirstSeats integer,MorningSecondSeats integer,NoonBalconySeats integer,NoonFirstSeats integer,NoonSecondSeats integer,MatneyBalconySeats integer,MatneyFirstSeats integer,MatneySecondSeats integer,SecondBalconySeats integer,SecondFirstSeats integer,SecondSecondSeats integer,FirstBalconySeats integer,FirstFirstSeats integer,FirstSecondSeats integer)");




////////////////////////////////////////////////loop for inserting datas into the date table


		Calendar cal=Calendar.getInstance();
		Calendar cltmp=Calendar.getInstance();

		cltmp.add(Calendar.DATE,7);

		int crdat=cal.get(Calendar.DATE);
		int crmth=cal.get(Calendar.MONTH);
		int cryer=cal.get(Calendar.YEAR);

		int tmdat=cltmp.get(Calendar.DATE);
		int tmmth=cltmp.get(Calendar.MONTH);
		int tmyer=cltmp.get(Calendar.YEAR);

		String st=new String();

		while(cal.before(cltmp)){
			crdat=cal.get(Calendar.DATE);
			crmth=cal.get(Calendar.MONTH);
			cryer=cal.get(Calendar.YEAR);

			st=crdat+"/"+crmth+"/"+cryer+"/";


			stmt.executeUpdate("insert into Date"+id+" values('"+st+"',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)");
		
			cal.add(Calendar.DATE,1);

		}



///////////////////////////////////////////////////////////////////////		
		%>
		<h1 align = "center"><font color = "Blue"><%
		out.println("Successfully created your account...!");
		%>
		</h1>
		</font><%
	}//if this block doesnt work there is a problem related to the database is occured...
////////////insert date because it cant be null	

	stmt.close();
        con.close();

%>		
<b>
<Fieldset>
<pre>
<legend>
<font color="gray">
Please sign in to see your account </font>
</legend>
<form name="form1" action="ProcessUsernamePassword.jsp">
 Username : <input type="text" name="username"><br><br>
 Pasword  : <input type="password" name="password"><br><br>
<center><input type="submit" value="Sign in"><br><br></center>
</pre></b>
</fieldset>
<%	

} catch(Exception e) {
	%><h1 align= "center"><font color ="red"><%
	out.println("Creation Failed !");%>
	</font> </h1>

	<center>
	<a href="Register.jsp">Click here to try again...</a>
	<%
	System.out.println(e);
}
	
%>


</body>
</html>