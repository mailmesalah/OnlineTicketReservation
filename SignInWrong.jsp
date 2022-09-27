<html>
<head>


<script>


/////////////////////

function check(){/////fill all boxes

		

	 for(var i=0;i<document.form1.elements.length;i++){
		
//alert(document.form1.elements[i].value);

	 	if(document.form1.elements[i].value==""){
		
			window.alert("Please Fill the boxes.");
			
			return false;
			
		}

		
	 }

	return true;
		
	
}


//////////////////

</script>


</head>
<body>
<font color="8A2EB2">
<u>
<h1 align = "center">
Wrong Username or Password
</u>
</h1>
</font>
<form name="form1" action="ProcessUsernamePassword.jsp" method="post" onSubmit="return check();">


<fieldset>
<pre>
<legend><b>
Please..
</legend>

 Username : <input type="text" name="username">
                                                  
 Password : <input type="password" name="password"><br>
                 <input type="submit" value="Sign In">
</pre>
</fieldset>

</body>
</html>