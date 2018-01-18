
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
		<%-- Comment No. 601
			After we write a tag file, there are two ways to deploy
			the file such that we can use it in a JSP page. The first
			way, which is also the simpler way, is directly placing 
			the tag file in the 'WEB-INF/tags' subdirectory, or 
			subdirectories of the subdirectory, of the web
			application that will use it. The second way is packaging
			the tag file in a jar file and then placing the jar file
			in the "WEB-INF/lib" directory of the web application. For
			the second way, we need to create an additional file called
			"Tag Library Descriptor" which provides information about
			the custom files, and the tag files should be placed in
			the "/META-INF/tags" directory of the jar file.
			
			To use a tag file in a JSP page, we still use the directive
			'taglib' to inform the web container of the directory
			where the tag file resides. For JSTL, we use the attribute
			'uri' to specify which tag library we want to use. For
			tag file, we use the attribute 'tagdir' to specify the
			directory where the tag file is. The value of 'tagdir' 
			has to be a path started with '/WEB-INF/tags'. As for
			the other attribute 'prefix', its usage is the same as
			for JSTL.					
		--%>
         <%@ taglib prefix='my' tagdir='/WEB-INF/tags' %>
		 <my:menu/>     
		</td>
	</tr>
</table>


<table>
	<tr>
		<td class="table-header"><BR>
			Welcome to the Course Enrollment System.<br>
			Department of Computer Science and Information Systems.<br>
			<BR>
			Please enter your user id and password for logging in the system.<br>
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
