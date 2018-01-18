


<html>
<head>
<title>Connect to MySQL in JSP directly</title>
</head>

<body>

<%@ page import="java.sql.*"%>

<jsp:useBean id="dbConnection" scope="page" class="db.DBConnection"/>
<%
	Connection conn = null; 
	
	try {
		conn = dbConnection.getConnection();
	} catch (Exception e) {
		out.println("<br>Failed to load MySQL JDBC driver!<br>");
		out.println(e);
		out.println("<br>");
	}
	
	
	//Finally display some message to indicate the status
	if (conn == null) {
		out.println("<br>Failed to get a connection to MySQL server!<br>");		
	} else {
		out.println("<br>Successfully get a connection to MySQL Server Using Java Bean!<br>");
		try {
		Statement stmt = conn.createStatement();
		String stmt_str = "select * from student";
		ResultSet rs = stmt.executeQuery(stmt_str);
			
		while (rs.next()) {
   			 out.println("<br>");
   			 out.println("first name: "+ rs.getString("first_name") + "<br>");
   			 out.println("last name: "+ rs.getString("last_name") +      "<br>");
  			 out.println("uni id: "+ rs.getInt("u_no") + "<br>");
   			 out.println("<br>");
		}

			conn.close();
		} catch (SQLException e) {
		}
	}
	
%>


</body>
</html>
