<html>

<head>
	<link href="style.css" rel="stylesheet" type="text/css"></link>
	<title>Course Enrollment System -- Error</title>
</head>


<body marginwidth="0" marginheight="0" leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td bgcolor="#000000">Course Enrollment System</td>
	</tr>

	<tr>
		<td bgcolor="#cccccc" height="18" class="menu">
        <%@ taglib prefix='my' tagdir='/WEB-INF/tags' %>
        <my:menu/> 
		</td>
	</tr>
</table>


<table>
	<tr>
		<td class="table-header"><BR>
			Access Error!<br>			
			<BR>
			You should log in before you can use the functions of this system<br>
			<br>
		</td>
	</tr>	
	
	<tr>
		<td class="table-header">
			<form name="form" method="POST" action="login.jsp">
				<table>
				<tr>
					<td><b>user id</b></td>
					<td><input type="text" name="user_id" value=""></td>
				</tr> 
				<tr>
					<td><b>password</b></td>
					<td><input type="password" name="password" value=""></td>
				</tr> 
				<tr>
					<td><input type="submit" name="submit" value="submit"></td>
				</tr>
				</table>
			</form>
		</td>
	</tr>

</table>

</body>

</html>
