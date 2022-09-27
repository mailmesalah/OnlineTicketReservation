<html>
<head>
<script>

/////////////////////

function check(){/////fill all boxes

		

	 for(var i=0;i<document.form1.elements.length;i++){
		
//alert(document.form1.elements[i].value);

	 	if(document.form1.elements[i].value==""||(document.form1.elements[4].value=="0")&&(document.form1.elements[5].value=="0")&&(document.form1.elements[6].value=="0")){
		
			window.alert("Please fill the box...And select atleast one seat.");
			
			return false;
			
		}

		
	 }

	return true;
		
	
}


//////////////////

</script>

</head>
<body>

<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<%
try{

	String th=request.getParameter("theater");

	String pl=request.getParameter("place");

	String sh=request.getParameter("show");

	String dy=request.getParameter("day");
	
	String mn=request.getParameter("month");
	
	String yr=request.getParameter("year");


	String dt=dy+"/"+mn+"/"+yr+"/";
	
	








System.out.println(th+"hello "+pl+" "+sh);

	

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
	out.println("<b>"+pl+"</b>");///////////////use table to make the name only as bold
	%>
	</font>
	</h1>
	
	<fieldset>
	<pre>
	<legend>
	
	<%
	///////////////use table to make the name only as bold
	out.println("<br><b>Show time and Film :<br><br></b> <b><font color = "+"Red"+">"+sh+" : "+fl+"</b></font>");///////////////use table to make the name only as bold
	%>
	</legend></pre>
	<%
	
///////////////////////////show time
	int i=5;
	String sht[]=new String[i];

	//checking can be done here
	sht[0]=rsmd.getColumnLabel(9);
//System.out.println(sht[0]);
	sht[1]=rsmd.getColumnLabel(10);
//System.out.println(sht[1]);
	sht[2]=rsmd.getColumnLabel(11);
//System.out.println(sht[2]);
	sht[3]=rsmd.getColumnLabel(12);
//System.out.println(sht[3]);
	sht[4]=rsmd.getColumnLabel(13);
//System.out.println(sht[4]);


/////////////////seats
	i=3;
	String sts[]=new String[i];
	
	//checking can be done here
	sts[0]=rsmd.getColumnLabel(17);
//System.out.println(sts[0]);
	sts[1]=rsmd.getColumnLabel(18);
//System.out.println(sts[1]);
	sts[2]=rsmd.getColumnLabel(19);
//System.out.println(sts[2]);



////////////////seatcost

	i=3;
	String stc[]=new String[i];
	
	//checking can be done here
	stc[0]=rs.getString(17);
//System.out.println(stc[0]);
	stc[1]=rs.getString(18);
//System.out.println(stc[1]);
	stc[2]=rs.getString(19);
//System.out.println(stc[2]);

///////////////////////seats number

	String temp=rs.getString("BalconySeats");

	int blstno=Integer.parseInt(temp);

	temp=rs.getString("SecondClassSeats");

	int scstno=Integer.parseInt(temp);

	temp=rs.getString("FirstClassSeats");

	int fcstno=Integer.parseInt(temp);

	temp=rs.getString("ID");

	int id=Integer.parseInt(temp);



//	ResultSet rsd=stmt.executeQuery("select * from Date"+id+"  where  Dates="+dt);


	ResultSet rsd=stmt.executeQuery("select * from Date"+id  );


/////////////////////////////////selecting reserved seats number


	
	int blst=0;
	int scst=0;
	int fcst=0;

	if(rsd.next()){//////////////////////////////only works if the date given exist in the database

		if(sh.equals(sht[0])){
//out.println(sh);

			temp=rsd.getString("MorningBalconySeats");			
			blst=Integer.parseInt(temp);
 			temp=rsd.getString("MorningSecondSeats");
			scst=Integer.parseInt(temp);
			temp=rsd.getString("MorningFirstSeats");
			fcst=Integer.parseInt(temp);

		}
		else if(sh.equals(sht[1])){
//out.println(sh);

			temp=rsd.getString("NoonBalconySeats");
			blst=Integer.parseInt(temp);
			temp=rsd.getString("NoonSecondSeats");
			scst=Integer.parseInt(temp);
			temp=rsd.getString("NoonFirstseats");
			fcst=Integer.parseInt(temp);

		}

		else if(sh.equals(sht[2])){
//out.println(sh);

			temp=rsd.getString("MatneyBalconySeats");
			blst=Integer.parseInt(temp);
			temp=rsd.getString("MatneySecondSeats");
			scst=Integer.parseInt(temp);
			temp=rsd.getString("MatneyFirstSeats");
			fcst=Integer.parseInt(temp);

		}
		else if(sh.equals(sht[3])){
//out.println(sh);

			temp=rsd.getString("SecondBalconySeats");
			blst=Integer.parseInt(temp);
			temp=rsd.getString("SecondSecondSeats");
			scst=Integer.parseInt(temp);
			temp=rsd.getString("SecondFirstSeats");
			fcst=Integer.parseInt(temp);


		}
		else if(sh.equals(sht[4])){
 //out.println(sh);

			temp=rsd.getString("FirstBalconySeats");
			blst=Integer.parseInt(temp);
			temp=rsd.getString("FirstSecondSeats");
			scst=Integer.parseInt(temp);
			temp=rsd.getString("FirstFirstSeats");
			fcst=Integer.parseInt(temp);

		}else{}





	}
	else{
System.out.println("No such a date!");


	}
System.out.println("hello");

//////////////////////////seats available

	
	blst=blstno-blst;////date+'id' table
	scst=scstno-scst;
	fcst=fcstno-fcst;


//////////////////////////


%>

<p><b><font color = "orange"><pre> Seat costs:</b></font>

<%
	for(i=0;i<3;i++){
		
		if(i==0){
		        out.println("<br>"+" "+sts[i]+"     : "+stc[i]+"<br>");
		}else if(i==1){
			out.println("<br>"+" "+sts[i]+" : "+stc[i]+"<br>");	
		
		}
		else{
			out.println("<br>"+" "+sts[i]+"  : "+stc[i]+"");
		}

		
		

	}
%>

</pre>
<!Seats available for each section(seats)//////////////////database should be created>



<form name="form1" action="CreditPassword.jsp" method="post" onSubmit="return check();" >

<%

out.println("<input type=\"hidden\" name=\"theater\" value=\""+th+"\">");
out.println("<input type=\"hidden\" name=\"place\" value=\""+pl+"\">");
out.println("<input type=\"hidden\" name=\"show\" value=\""+sh+"\">");
out.println("<input type=\"hidden\" name=\"date\" value=\""+dt+"\">");

%>
<pre>
 No of Balcony seats reserving      : <select name="balconyno">
<%
	for(i=0;i<=blst;++i){

	out.println("<option value=\""+i+"\">"+i+"</option>");
	}
%>
</select></b>

 No of First class seats reserving  : <select name="secondno">
<%
	for(i=0;i<=scst;++i){

	out.println("<option value=\""+i+"\">"+i+"</option>");
	}
%>
</select></b>


 No of Second class seats reserving : <select name="firstno">
<%
	for(i=0;i<=fcst;++i){

	out.println("<option value=\""+i+"\">"+i+"</option>");
	}
%>
</select></b>



<b><font color = "green"> Enter your Credit card number      :</b> <input type ="textbox" name="cardno" value="" size="15">


<center><input type="reset" value=" Clear All ">  <input type="submit" value=" Submit ">
</center>
</form>
</pre>
</field>
<%
///////////////////////////
}
catch(Exception e){System.out.println(e);}
	
%>
</body>
</html>