

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


<%@ page import="java.sql.*,java.util.Vector" %>
<jsp:useBean id="db" class="ecom.DBConnection" scope="session" />

<%

	/* Comment No 2
		First we retrieve the list of course_no from the "request" object. */
		
	String[] courses = request.getParameterValues("course_no");


	/* Comment No 3
		Then we insert the course enrollments one by one.*/
		
	String sqlStmt = "INSERT INTO enrollment_info values ('" + user.getUserId() +"', ?)";

	Connection conn = db.getConnection();	
	
	PreparedStatement pstmt = conn.prepareStatement(sqlStmt);
	
	Vector succeed = new Vector();
	Vector fail = new Vector();	
	for (int i=0; i < courses.length; i++) {
		pstmt.clearParameters();
        pstmt.setString(1, courses[i]);

        try {
			int aq = pstmt.executeUpdate();
			succeed.addElement(courses[i]);
        } catch (SQLException sqle) {			
            fail.addElement(courses[i]);
    	}
	}	
	
	pstmt.close();
	
	
	/* Comment No. 4 */
		   
	if (succeed.size() == 0) {
		out.println("<P>No course was added successfully.");
	} else {
		out.println("<P>The following courses were added successfully:<br>");
		for (int i = 0; i < succeed.size(); i++) {
			out.println("<li>" + succeed.elementAt(i) + "</li>");			
		}
	}	
	
	if (fail.size() != 0) {
		out.println("<P>The following courses failed to enroll:<br>");
		for (int i = 0; i < fail.size(); i++) {
			out.println("<li>" + fail.elementAt(i) + "</li>");			
		}
	}
		
%>