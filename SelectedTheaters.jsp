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
	
	String flms=request.getParameter("filmname");
System.out.println(flms);

	ResultSet rs=stmt.executeQuery("select * from Accounts where MorningShow like '%"+flms+"%'  or NoonShow like '%"+flms+"%' or MatneyShow like '%"+flms+"%' or FirstShow like '%"+flms+"%' or SecondShow  like '%"+flms+"%'");
///////check for films
		

		String th=new String();
		String temp=new String();
		String fl=new String();
		String pl=new String();
		String cth=new String();
		String cpl=new String();
		int in=0;
		int rlen=0;

///////////////////////////////////////////selecting films,,,reduntancy should	be considered	




		while(rs.next()){

			in=0;
			rlen++;////row length


			cpl=rs.getString("Place");

			cth=rs.getString("TheaterName");

			pl=pl+"$"+cpl;
			th=th+"$"+cth;
System.out.println(th);



			for(int i=9;i<=13;i++){/////////different films in a theater with same string pattern 
				
				temp=rs.getString(i);
				if((temp.indexOf(flms))>=0){
					if(in==0){
						in=1;
					}
					else{
						pl=pl+"$"+cpl;
						th=th+"$"+cth;						

					}
					fl=fl+"$"+temp;
				}	
	
			}
			

		}

System.out.println(th);
System.out.println(pl);
System.out.println(fl);





//////////////////////////////////////////Tokenizing the string

//System.out.println(th);

		StringTokenizer stkt=new StringTokenizer(th,"$");
		StringTokenizer stkp=new StringTokenizer(pl,"$");
		StringTokenizer stkf=new StringTokenizer(fl,"$");

		int len=stkt.countTokens();
//System.out.println(len);
//System.out.println(stkp.countTokens());
//System.out.println(stkf.countTokens()+"ok");
		String tha[]=new String[len];/////for storing theater name list which has the films searched
		String pla[]=new String[len];
		String fla[]=new String[len];	

		int i=0;	
		while(stkf.hasMoreTokens()){///////////collecting
		
System.out.println("hello");

			fla[i]=stkf.nextToken();
			tha[i]=stkt.nextToken();
			pla[i]=stkp.nextToken();	
			++i;	
		
		}

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
	





//checking

	 %>
	<h1 align ="center">
	<font color= "orange">
	<%
	out.println("Search Result");
	%>
	</h1></font>
	<Fieldset>
	
	<legend>
	<font color="#EC153C">
	Theaters are
	</font>
	</legend>

	<br>
	<%

	for(i=0;i<clen;++i){
        out.println(" "+(i+1)+"	<font color = \"greenlime\">. <a href=\"ReserveSeats.jsp?theater="+than[i]+"\"> Theater "+than[i]+" Film<b> "+flan[i]+"</b> Place "+plan[i]+" </a></font><br><br>");

	}
	%>
	
	
	</fieldset>
	<%
	
	rs.close();
	stmt.close();
        con.close();

System.out.println("<br>works till catch()");

} catch(Exception e) {
	System.out.println(e);
}


%>
</body>
</html>
