
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
        <font color="#ffffff">|</font> <B><a class="menu" href="home.jsp">Home</a></B>
        <font color="#ffffff">|</font> <B><a class="menu" href="addCourse.jsp">Add Course</a></B>
        <font color="#ffffff">|</font> <B><a class="menu" href="dropCourse.jsp">Drop Course</a></B>                
        <!-- Comment No. 501 
        	Add a link for catalog browsing. -->
        <font color="#ffffff">|</font> <B><a class="menu" href="browseBooks.jsp">Browse Textbooks</a></B>
        <font color="#ffffff">|</font> <B><a class="menu" href="logout.jsp">Logout</a></B>
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
		<td class="table-header">
			<form name="form" method="POST" action="login.jsp">
				<!-- Comment No 1
					Set the names of the parameters to be submitted 
					for logging in the system, i.e. change XXXXXX
					to user_id and password respectively. -->
				<table>
				<tr>
					<td class="table-header"><b>user id</b></td>
					<td><input type="text" name="user_id" value=""></td>
				</tr> 
				<tr>
					<td class="table-header"><b>password</b></td>
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
