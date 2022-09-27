<html>
<head>
</head>

<body>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
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
	dob=mth+"/"+day+"/"+yer+"/";


	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:dsn","","");
	Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	int i=stmt.executeUpdate("insert into Accounts (Username,UName,Password,TheaterName,LicenceNo,Age,Sex,DateOfBirth,MorningShow,NoonShow,MatneyShow,FirstShow,SecondShow,BalconySeats,SecondClassSeats,FirstClassSeats,BalconyCost,SecondClassCost,FirstClassCost,Email,Address,Place,Pincode,State,District)values('"+un+"','"+usn+"','"+psw+"','"+thn+"','"+lcn+"',"+age+",'"+sex+"',"+dob+",'$"+mgs+"','$"+nns+"','$"+mts+"','$"+fts+"','$"+scs+"',"+0+bcs+","+0+scst+","+0+ftst+","+0+bcc+","+0+scc+","+0+fcc+",'"+ema+"','"+adr+"','"+plc+"',"+pin+",'"+stt+"','"+dic+"')");


/*	ResultSet rs=stmt.executeQuery("select * from Accounts ");
	rs.next();
//	System.out.println(rs.getString("ID"));
	
	String id=rs.getString("ID");

//	stmt.executeUpdate("create table Date"+id+" (Dates date not null,MorningBalconySeats integer,MorningFirstSeats integer,MorningSecondSeats integer,NoonBalconySeats integer,NoonFirstSeats integer,NoonSecondSeats integer,MatneyBalconySeats integer,MatneyFirstSeats integer,MatneySecondSeats integer,SecondBalconySeats integer,SecondFirstSeats integer,SecondSecondSeats integer,FirstBalconySeats integer,FirstFirstSeats integer,FirstSecondSeats integer)");


	//Calendar cal=Calendar.getInstance();
	
	session.setAttribute("sad","sad");
	Object obj = session.getAttribute("sad");
	String xz = obj.toString();
	out.println(xz);	

	String months[] = {"Jan", "Feb", "Mar", "Apr","May", "Jun", "Jul", "Aug","Sep", "Oct", "Nov", "Dec"};

	// Create a calendar initialized with the
	// current date and time in the default
	// locale and timezone.

	Calendar cal=Calendar.getInstance();
	Calendar cltmp=Calendar.getInstance();

	cltmp.add(Calendar.DATE,7);

	int crdat=cal.get(Calendar.DATE);
	int crmth=cal.get(Calendar.MONTH);
	int cryer=cal.get(Calendar.YEAR);

	int tmdat=cltmp.get(Calendar.DATE);
	int tmmth=cltmp.get(Calendar.MONTH);
	int tmyer=cltmp.get(Calendar.YEAR);

	java.sql.Date dt=new java.sql.Date(00,00,00);
	


//	java.sql.Date dt;

//	dt.valueOf("04/03/1988");



	while(cal.before(cltmp)){
		crdat=cal.get(Calendar.DATE);
		crmth=cal.get(Calendar.MONTH);
		cryer=cal.get(Calendar.YEAR);


		dt.setYear(cryer-1900);
		dt.setMonth(crmth);
		dt.setDate(crdat);
out.println(dt.toString());

		stmt.executeUpdate("insert into Date"+id+" values("+dt+",0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)");

		
out.println("<br> D"+crdat);
out.println(" M"+crmth);
out.println(" Y"+cryer);

		cal.add(Calendar.DATE,1);

	}

//////////////////////////////////////////////////////////////////////////////////////////////
	Calendar calendar = Calendar.getInstance();

		
	calendar.add(Calendar.DATE,7);

	// Display current time and date information.

	out.print("Date: ");
	out.print(months[calendar.get(Calendar.MONTH)]);
	out.print(" " + calendar.get(Calendar.DATE) + " ");
	out.println(calendar.get(Calendar.YEAR));
	out.print("Time: ");
	out.print(calendar.get(Calendar.HOUR) + ":");
	out.print(calendar.get(Calendar.MINUTE) + ":");
	out.println(calendar.get(Calendar.SECOND));

	// Set the time and date information and display it.

	calendar.set(Calendar.HOUR, 10);
	calendar.set(Calendar.MINUTE, 29);
	calendar.set(Calendar.SECOND, 22);
	out.print("Updated time: ");
	out.print(calendar.get(Calendar.HOUR) + ":");
	out.print(calendar.get(Calendar.MINUTE) + ":");
	out.println(calendar.get(Calendar.SECOND));

///////////////////////////////////////////////////////////////


	// Display current time and date information.

	out.print("Date: ");
	out.print(months[cal.get(Calendar.MONTH)]);
	out.print(" " + cal.get(Calendar.DATE) + " ");
	out.println(cal.get(Calendar.YEAR));
	out.print("Time: ");
	out.print(cal.get(Calendar.HOUR) + ":");
	out.print(cal.get(Calendar.MINUTE) + ":");
	out.println(cal.get(Calendar.SECOND));

	// Set the time and date information and display it.

	cal.set(Calendar.HOUR, 10);
	cal.set(Calendar.MINUTE, 29);
	cal.set(Calendar.SECOND, 22);
	out.print("Updated time: ");
	out.print(cal.get(Calendar.HOUR) + ":");
	out.print(cal.get(Calendar.MINUTE) + ":");
	out.println(cal.get(Calendar.SECOND));
*/



}
catch(Exception e){

	System.out.println(e);


}

%>


</body>
</html>