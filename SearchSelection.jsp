<html>
<head>
<script>

/////////////////////

function check(){

		

	 for(var i=0;i<document.form1.elements.length;i++){
		
//alert(document.form1.elements[i].value);
		//if(document.form1.elements[i].type =="text"){
	 	if(document.form1.elements[i].value==""){
		
			window.alert("Please fill the box...");
			
			return false;
			
		}
		
		
	 }
		
	return true;
	
}
//////////////////

</script>

<h1 align ="center">
<font color = "ff69b4"> 
<u>
Search
</u>
</font>
</h1>

</head>
<body>
<fieldset>
<pre>
<font color = "#808000">
<legend><b>
Search your choice for reservation
</font>
</legend>
<%
//////////////////////////////////////
/*

Sorting should be done while query for listing in order

checking should be done for listinf show time, seats etc

autocommit should be done

should change lists according to its former lists

	
*/
/////////////////search list%>

<form name="form1" action="SearchResult.jsp" method="post" onSubmit="return check();">                                                                       
 Search by: <select name="searchselect">
	<option value="Film">Film</option>
	<option value="Place">Place</option>
	<option value="TheaterName">Theater Name</option>
</select>


 Text     : <input type="textbox"name="text1">


<center><input type="submit" value="  Search  "></center></form>
</fieldset>
</body>


</html>