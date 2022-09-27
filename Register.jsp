<!Check all filling datas>
<html>
<head>

<script>



function check(){

	
	var b=0;	 

	 for(var i=0;i<18;i++){
		
		//alert(document.form1.elements[i].value);
		//if(document.form1.elements[i].type =="text"){
	 	if(document.form1.elements[i].value==""){
		
			window.alert("Please fill up needed details...");
			b=1;
			return false;
			
		}
		
		
		//}
		
	

	 }
		
	if(check2()){ //password
		return false;
	}
	if(check3()){ //email
		return false;
	}
	//if(check4()){//pincode
	//	return false;			
	//}
	return true;
	
}

function check2(){
	//window.alert(document.form1.elements[2].value);
	//window.alert(document.form1.elements[3].value);
	if(document.form1.elements[2].value==document.form1.elements[3].value){
		//alert("sad");
		return false;	
	}
	else{
		alert("Check Password");
		return true;
	}
	
}

function check3(){

	//alert(document.form1.elements[18].value);
	var mail = document.form1.elements[10].value;
	
	//alert((mail.indexOf("@")>0)<mail.indexOf("."));
	if((mail.indexOf("@")>0)&&(mail.indexOf(".")>mail.indexOf("@"))){
		//alert("sad");
		return false;
	}
	else{
		alert("Invalid email address");
	}
	return true;
}
function check4(){
	alert("aaa");
	var pin = document.form1.elements[7].value;
	if(pin.isNumeric()){
		alert("saD");
	}
}
</script>



</head>

<body>
<h1 align = "center"><u><font color="#8A2BE2">Registration Form</u></font></h1>
<form name="form1" action="CreateAccount.jsp" method="post" onSubmit="return check()" >
<fieldset>
<legend>
<h4><font color="#808000">Enter your details...</font><h4>
</legend><font color = "">
<pre>
 Username     : <input type="text" name="username"value="">
 Password     : <input type="password" name="password"value="">
 Re enter     : <input type="password" name="rpassword"value="">
 
 Name         : <input type="text" name="uname"value="">
 Address      : <input type="text" name="address"value="">
 Place        : <input type="text" name="place"value="">
 Pincode      : <input type="text" name="pincode"value="">
 State        : <
 name="state"><option value="kerala">Kerala</option></select>
 District     : <select name="district"><option value="malappuram">Malappuram</option></select>
 email        : <input type="text" name="email"value=""> 
 Sex          : <select name="sex"><option value="f">F</option><option value="m">M</option></select>
 Age          : <select name="age">

<%

for(int i=18;i<61;++i){
	
	out.println("<option value=\""+i+"\">"+i+"</option>");
}

%>
</select>
 Date of birth: <select name="day">

<%

////////////////////// should change according to month for 29 for February

for(int i=1;i<32;++i){

	out.println("<option value=\""+i+"\">"+i+"</option>");
}

%>

 </select>-<select name="mth">/////////////////////month

<%

for(int i=1;i<13;++i){

	out.println("<option value=\""+i+"\">"+i+"</option>");
}

%>

</select>-<select name="yer">//////////////year

<%

///////////////////////current year minus maximum age(age field) and for limit minus 18

for(int i=1948;i<1991;++i){

	out.println("<option value=\""+i+"\">"+i+"</option>");
}

%>
</select>
</font> 
</pre>
</fieldset>
<br>
<br>
<fieldset>
<legend><font color ="#FF8C00">Theater Details           
</font>
</legend>
<pre><font color = "#8B0000">
 Theater name : <input type="text" name="theatername"value="">
 Licence No   : <input type="text" name="licenceno"value="">
 
 Morning Show : <input type="text" name="morningshow"value="">
 Noon Show    : <input type="text" name="noonshow"value="">
 Matney Show  : <input type="text" name="matneyshow"value="">
 First Show   : <input type="text" name="firstshow"value="">
 Second Show  : <input type="text" name="secondshow"value="">
 
 Balcony Seats      : <input type="text" name="balconyseats"value="">
 Second Class Seats : <input type="text" name="secondclassseats"value="">
 First Class Seats  : <input type="text" name="firstclassseats"value="">
 
 Balcony Cost       : <input type="text" name="balconycost"value="">
 Second Class Cost  : <input type="text" name="secondclasscost"value="">
 First Class Cost   : <input type="text" name="firstclasscost"value="">

                         <center>                <input type="submit" value="Submit" > </center>
</font>
</pre>
</fieldset>
</form>
</body>
</html>