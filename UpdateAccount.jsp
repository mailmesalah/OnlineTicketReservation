<!Updation of Date of birth>
<html>
<head>
<script>

/////////////////////

function check(){/////fill all boxes

		

	 for(var i=0;i<document.form1.elements.length;i++){
		
//alert(document.form1.elements[i].value);

	 	if(document.form1.elements[i].value==""){
		
			window.alert("Please fill all the boxes.");
			
			return false;
			
		}

		
	 }

	return check1();
		
	
}



function check1(){/////password checking

		



 	if(document.form1.elements[1].value!=document.form1.elements[2].value){
		
		window.alert("Password mismatch!");
			
		return false;
			
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

	Object un=session.getAttribute("username");
//	System.out.println(un);
	Object pw=session.getAttribute("password");
//out.println(un+" "+pw);
//connecting database
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:dsn","","");
	Statement stmt=con.createStatement();


	ResultSet rs=stmt.executeQuery("select * from Accounts where Username='"+un+"' and Password='"+pw+"'");
		
	if(!rs.next()){response.sendRedirect("SignIn.jsp");}
	
	String st[]=new String[26];
		
	for(int i=1;i<=26;++i){
		st[i-1]=rs.getString(i);
	}

	%> 
	
	<h1 align = "center">
      <font color = "#AB2334">
	Update
	</font> 
      </h1>
	
	<fieldset>
	<pre>
	<legend>
	<font color = "#4169E1">
	<%out.println("<br>Update your account... ");%>
	</font>
	<font color = "#C71585">
	</legend><b>
	<font size = "3">
 
<form name="form1" action="UpdatingAccount.jsp" method="post" onSubmit="return check();">
<%
out.println(" Username      :<input type=\"text\" name=\"username\"value=\""+st[1]+"\">");
out.println(" Password      :<input type=\"password\" name=\"password\"value=\"\">");
out.println(" Re enter      :<input type=\"password\" name=\"rpassword\"value=\"\">");
out.println(" Address       :<input type=\"text\" name=\"address\"value=\""+st[20]+"\">");
out.println(" Place         :<input type=\"text\" name=\"place\"value=\""+st[21]+"\">");
out.println(" Pincode       :<input type=\"text\" name=\"pincode\"value=\""+st[22]+"\">");
out.println(" State         :<input type=\"text\" name=\"state\"value=\""+st[23]+"\">");
out.println(" Distric       :<input type=\"text\" name=\"district\"value=\""+st[24]+"\">");
out.println(" email         :<input type=\"text\" name=\"email\"value=\""+st[19]+"\">");
out.println(" Sex           :<input type=\"text\" name=\"sex\"value=\""+st[6]+"\">");
out.println(" Age           :<input type=\"text\" name=\"age\"value=\""+st[5]+"\">");
out.println(" Date of Birth :<input type=\"text\" name=\"dateofbirth\"value=\""+st[7]+"\"><br>");//.substring(0,10)+"\"><br>");

out.println(" Theater name :<input type=\"text\" name=\"theatername\"value=\""+st[3]+"\">");
out.println(" Licence No   :<input type=\"text\" name=\"licenceno\"value=\""+st[4]+"\"><br>");
                         
out.println(" Morning Show :<input type=\"text\" name=\"morningshow\"value=\""+st[8]+"\">");
out.println(" Noon Show    :<input type=\"text\" name=\"noonshow\"value=\""+st[9]+"\">");
out.println(" Matney Show  :<input type=\"text\" name=\"matneyshow\"value=\""+st[10]+"\">");
out.println(" First Show   :<input type=\"text\" name=\"firstshow\"value=\""+st[11]+"\">");
out.println(" Second Show  :<input type=\"text\" name=\"secondshow\"value=\""+st[12]+"\"><br>");

out.println(" Balcony Seats      :<input type=\"text\" name=\"balconyseats\"value=\""+st[13]+"\">");
out.println(" Second Class Seats :<input type=\"text\" name=\"secondclassseats\"value=\""+st[14]+"\">");
out.println(" First Class Seats  :<input type=\"text\" name=\"firstclassseats\"value=\""+st[15]+"\">");
out.println(" Balcony Cost       :<input type=\"text\" name=\"balconycost\"value=\""+st[16]+"\">");
out.println(" Second Class Cost  :<input type=\"text\" name=\"secondclasscost\"value=\""+st[17]+"\">");
out.println(" First Class Cost   :<input type=\"text\" name=\"firstclasscost\"value=\""+st[18]+"\"><br>");
%>
<center><input type="submit" value="Update"><br></center>
</pre>
</font>
</fieldset>
<%	

	
	rs.close();
	stmt.close();
        con.close();



} catch(Exception e) {
	System.out.println(e);
}
	
%>

</body>
</html>