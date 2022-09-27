<html>
<head>
</head>

<body>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%
try{
	
//connecting database
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:dsn","","");
	Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	ResultSet rs;

	String src=request.getParameter("field");
	String sft=request.getParameter("data");
	
System.out.println(src+" "+sft);	

///////////////////////////////////////////selecting films,,,reduntancy should	be considered	
//	rs=stmt.executeQuery("select * from Accounts " );
	rs=stmt.executeQuery("select * from Accounts where "+src+" like'%"+sft+"%'" );
	ResultSetMetaData rsmd=rs.getMetaData();



//////////////////////////////////////////


	String th=new String();
	String temp=new String();
	String fl=new String();
	String pl=new String();
	String cth=new String();
	String cpl=new String();
	int in=0;
	int rlen=0;

	while(rs.next()){
		
		++in;	

		th=th+" "+rs.getString("TheaterName");
		pl=pl+" "+rs.getString("Place");

		
		for(int i=9;i<=13;++i){
		
			fl=fl+" "+rs.getString(i);

		}
	}



//////////////////////////////////////////Tokenizing the string



	StringTokenizer stkt=new StringTokenizer(th," ");
	StringTokenizer stkp=new StringTokenizer(pl," ");
	StringTokenizer stkf=new StringTokenizer(fl," ");


	int len=stkt.countTokens();
System.out.println(len);
	String tha[]=new String[len];/////for storing theater name list which has the films searched	
	String pla[]=new String[len];

	int fln=stkf.countTokens();
	String fla[]=new String[fln];

	int i=0;	
	while(stkt.hasMoreTokens()){///////////collecting
		
//System.out.println("Hellof");		
		tha[i]=stkt.nextToken();
		pla[i]=stkp.nextToken();	

		++i;	
	}


////////////////////for different films in the same theater
/*
	i=0;
	while(stkf.hasMoreTokens()){///////////collecting
		fla[i]=stkf.nextToken();
System.out.println(fla[i]);	

		++i;	
	}


//////////////////////////copied want modification
		String than[]=new String[len];
		String plan[]=new String[len];
		String flan[]=new String[len];

		int clen=0;
		int k=0;
		int thstatus=0;
		int flstatus=0;
		than[0]=tha[0];
		plan[0]=pla[0];
		flan[0]=fla[0];


		i=0;
		
		while(i<len){
			thstatus=0;
			flstatus=0;

			for(k=0;k<clen;++k){
				if(tha[i].equals(than[k])){
					
					thstatus=1;
					
					if(fla[i].equals(flan[k])){

						flstatus=1;


					}
				}


			}
			if((thstatus==1 && flstatus==0)||(thstatus==0)){
			
				flan[k]=fla[i];
				plan[k]=pla[i];
				than[k]=tha[i];
				++clen;
//System.out.println(than[k]);
//System.out.println(flan[k]);


			}
		
			++i;

		}
	

*/





/////////////////////////////////////////////////

//System.out.println(stk.countTokens());

//System.out.println(stk.nextToken());

	out.println("<h4>Search Results are ...</h4>");


	for(i=0;i<tha.length;i++){

		out.println((i+1)+" .<a href=\"ReserveSeats.jsp?theater="+tha[i]+"\">Theater "+tha[i]+" Place "+pla[i]+" </a><br><br>");

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