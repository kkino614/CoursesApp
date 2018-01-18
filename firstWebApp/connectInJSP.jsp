<html>
<head>
<title>Connect to MySQL in JSP directly</title>
</head>

<body>


<%@ page import="java.sql.*"%>

<%
	/*
	 * You have to complete Lab 3 exercise 2 before you try this.
	 */


	/************************************************************
	 *  Step 1: Load the MySQL JDBC driver class *
	 ************************************************************/
	try {
		Class.forName("com.mysql.jdbc.Driver");
	} catch (Exception e) {
		out.println("<br>Failed to load MySQL JDBC driver!<br>");
		out.println(e);
		out.println("<br>");
	}
	
	
	/******************************************************************
	 *  Step 2: Construct the URL to be used to connect to 
	 *          the MySQL database server.
     *                                                                *
     *  The format of JDBC URL is as follows:  
     *         
     *  jdbc:mysql://[hostname][:port]/[dbname][?param1=value1][&param2=value2]  
     *
	 ******************************************************************/
	
	//change the following accordingly  
	String db_name = "ecdb040";
	String user_name = "ecom040";
	String pwd = "BKTfWeii"; 
	 
	String mysqlURL = "jdbc:mysql://honest.cs.hku.hk:59040/" 
				+ db_name 
				+"?user=" + user_name 
				+"&password=" + pwd;
	
	
	/************************************************************
	 *  Step 3: Get a connection using the URL				 *
	 ************************************************************/
	Connection conn = null; 
	
	try {
		conn = DriverManager.getConnection(mysqlURL);
	} catch (Exception e) {
		out.println("<br>Failed to get a Connection to MySQL server!<br>");
		out.println(e);
		out.println("<br>");
	}
	
	
	//Finally display some message to indicate the status
	if (conn == null) {
		out.println("<br>Failed to get a connection to MySQL server!<br>");		
	} else {
		out.println("<br>Successfully get a connection to MySQL Server!<br>");
		try {
			Statement stmt = conn.createStatement();
			String stmt_str = "select * from course";
			ResultSet rs = stmt.executeQuery(stmt_str);
			while (rs.next()) {
			 out.println("<br>");
			 out.println("name: "+ rs.getString("name") + "<br>");
			 out.println("deparment: "+ rs.getString("department") + "<br>");
			 out.println("course_no: "+ rs.getString("course_no") + "<br>");
			 out.println("<br>");
			}
			conn.close();
		} catch (SQLException e) {
		}
	}
	

%>
</body>
</html>
