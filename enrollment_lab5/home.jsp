

<!-- Comment No. 1
	First we check whether the user has logged in. -->

<jsp:useBean id="user" class="ecom.UserInfo" scope="session" />

<% if (!user.isLoggedIn()) { %>

<jsp:forward page="error.jsp" />

<% } %>


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
        <font color="#ffffff">|</font> <B><a class="menu" href="browseBooks.jsp">Browse Textbooks</a></B>
        <font color="#ffffff">|</font> <B><a class="menu" href="logout.jsp">Logout</a></B>
        <font color="#ffffff">|</font>
		</td>
	</tr>
</table>


<table>
	<tr>
		<td class="table-header"><BR>
			Welcome to the course enrollment system.<br>
			There are several functions that you could perform:<br>
			- Enroll a course<br>
			- Drop a course<br><br>
		</td>
	</tr>	
</table>

</body>

</html>
