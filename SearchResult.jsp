<html>
<head>
</head>
<body>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%
try{
	String src=request.getParameter("searchselect");
	String sft=request.getParameter("text1");
	sft.toLowerCase();





//connecting database
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:dsn","","");
	Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs;

	if(src.equals("Film")){

///////check for films
		


		rs=stmt.executeQuery("select * from Accounts where MorningShow like '%"+sft+"%'  or NoonShow like '%"+sft+"%' or MatneyShow like '%"+sft+"%' or FirstShow like '%"+sft+"%' or SecondShow  like '%"+sft+"%'");





		if(rs.next()){

System.out.println("found "+sft);
			response.sendRedirect("SelectedTheaters.jsp?filmname="+sft);	


		}

		else{


			response.sendRedirect("NoTheaterFind.jsp?filmname="+sft);
		}
	}
	else{

/////////////////////////////select if some words matches

		rs=stmt.executeQuery("select * from Accounts " );
		ResultSetMetaData rsmd=rs.getMetaData();

		String dat=new String();
		

		while(rs.next()){

			dat=rs.getString(src);
			if(dat.indexOf(sft)>=0){
//System.out.println("Hello");

				response.sendRedirect("TheatersFound.jsp?field="+src+"&data="+sft);						
			}		

	

		}
		response.sendRedirect("NoTheaterNamesFound.jsp?data="+sft);
	}


	//rs.close();
	stmt.close();
        con.close();

out.println("<br>works till catch()");

} catch(Exception e) {
	System.out.println(e);
}

%>
</body>
</html>