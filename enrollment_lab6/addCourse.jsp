

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
        <%@ taglib prefix='my' tagdir='/WEB-INF/tags' %>
         <my:menu current='Add Course'/>  
		</td>
	</tr>
</table>


<%@ page import="java.sql.*" %>
<jsp:useBean id="db" class="ecom.DBConnection" scope="session" />

<%
	Connection conn = db.getConnection();
	
	/* Comment No. 2
		Since MySQL 4.0 doesn't support subquery feature, 
		we have to use "join" work around it. */
		
	String sqlStmt = "SELECT c.* FROM course_info as c LEFT JOIN enrollment_info as e ON c.course_no=e.course_no AND e.user_id=? WHERE e.course_no IS NULL";
	
	
	/*Comment No. 3 
		Then we execute the statement to retrieve the required data.
	*/
	PreparedStatement pstmt = conn.prepareStatement(sqlStmt);
	
	pstmt.setString(1, user.getUserId());
	
	ResultSet rs = pstmt.executeQuery();
	
	if (!rs.next()) {
		out.println("<P> You have added all courses! No more courses can be added.");
	} else {
%>	
		<form name="form" method="POST" action="addCourseResult.jsp">
		<table border="1" cellspacing="0" cellpadding="5" width="75%">
			<tr>
			<td bgcolor="#cccccc" width="50" valign="center" class="table-header">&nbsp;</td>
			<td bgcolor="#cccccc" width="140" valign="center" class="table-header">Course Code</td>
			<td bgcolor="#cccccc" width="140" valign="center" class="table-header">Course Name</td>
			<td bgcolor="#cccccc" width="140" valign="center" class="table-header">Semester</td>
		    </tr>
		
<%
		do {
%>		
			<tr>
			<td bgcolor="#eeeeee"><input type="checkbox" name="course_no" value="<%= rs.getString("course_no") %>" />
			<td bgcolor="#eeeeee"><b><font color="#0000aa"> <%= rs.getString("course_no") %> </font></b></td>
			<td bgcolor="#eeeeee"><b><font color="#0000aa"> <%= rs.getString("name") %> </font></b></td>
			<td bgcolor="#eeeeee"><b><font color="#0000aa"> <%= rs.getString("semester") %> </font></b></td>
			</tr>
<%			
		} while (rs.next());
		
%>
		</table>
		<table border="0">
			<tr>
				<td>
					<input type="submit" name="submit" value="submit">
					<input type="reset" name="reset" value="reset">
				</td>
			</tr>
		</table>
		</form>	
<%		
	}
	
	rs.close();
	pstmt.close();
	
%>