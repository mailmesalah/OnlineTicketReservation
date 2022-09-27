<html>
<head>



<script>

/////////////////////

function check(){/////fill all boxes

		

	 for(var i=0;i<document.form1.elements.length;i++){
		
//alert(document.form1.elements[i].value);

	 	if(document.form1.elements[i].value==""){
		
			window.alert("Please enter the code.");
			
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
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%

try{
	
	String id=request.getParameter("id");
System.out.println(id);

///////////////////////////////////////////////a search box to validate code

%>
<form name="form1" action="SearchCode.jsp" method="post" onSubmit="return check();">

<%
out.println("<input type=\"hidden\" name=\"id\" value=\""+id+"\">");
%>

<pre>
 
 
 
</pre><h1 align = "center"><font color = "Orange">Code Validation

</h1></font><pre>

</pre>	
<fieldset>
<legend>
</legend>
<pre>


							<b><font color = "brown+black">Enter your code here: <b><input type="textbox" name="code">



<center><input type="submit" value="   Submit   "></center>
</pre>
</pre>
</fieldset>
</form>



<%
/////////////////////////////////////////////////
}
catch(Exception e){

	System.out.println(e);


}

%>


</body>
</html>