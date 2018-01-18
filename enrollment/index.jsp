<html>

<head>
	<link href="style.css" rel="stylesheet" type="text/css"></link>
	<title>Course Enrollment System</title>
</head>


<body marginwidth="0" marginheight="0" leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td bgcolor="#000000">Course Enrollment System</td>
	</tr>

	<tr>
		<td bgcolor="#cccccc" height="18" class="menu">
        <font color="#ffffff">|</font> <B><a href="home.jsp">Home</a></font></B>
        <font color="#ffffff">|</font> <B><a href="addCourse.jsp">Add Course</a></B>
        <font color="#ffffff">|</font> <B><a href="dropCourse.jsp">Drop Course</a></B>        
        <font color="#ffffff">|</font> <B><a href="logout.jsp">Logout</a></B>
        <font color="#ffffff">|</font>
		</td>
	</tr>
</table>


<table>
	<tr>
		<td class="table-header"><BR>
			Welcome to the Course Enrollment System.<br>
			Department of Computer Science and Information Systems.<br>
			<BR>
			Please enter your user id and password for logging in into the system.<br>
			<br>
		</td>
	</tr>	
	
	<tr>
		<td>
			<form name="form" method="POST" action="login.jsp">
				<!-- Comment No 1
					Set the names of the parameters to be submitted 
					for logging in the system, i.e. change XXXXXX
					to user_id and password respectively. -->
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
