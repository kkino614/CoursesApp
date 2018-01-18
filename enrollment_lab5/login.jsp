
<!-- Comment No. 1
These lines is a comment, its syntax is the same as in HTML or XML. 
The syntax for adding comment inside a JSP scritpting tag, as you can
see later, is different. And, besides these two ways, there is a third
way to add comment, the comment added in this way won't be returned 
the client.
-->


<%-- Comment No. 2	
This is another way to add comment. We need to use this way since
this comment contains JSP opening tag and closing tag delimiters.

Use the JSP directive "page" to import necessary classes, the 
opening tag for a JSP directive is "<%@", the closing tag is "%>" --%>

<%@ page import="java.sql.*" %>


<%-- Comment No. 3
Use a scipting element to include Java code to process the 
request from the client. The opening tag for scripting element is
"<%" and the closing tag is "%>" --%>


<%
	/* Comment No. 4
		Whe you insdie a scripting element, you can add comment just
		as if you were writing a Java program. */
	//  So you can add comment like "Comment No. 4" and this.	
	
	/* Comment No. 5
		Inside a JSP page, you can access some "hidden" Java
		objects that you don't need to create by yourself. These object
		are created by the JSP container, i.e. Tomcat, and they are
		called the implicit objects. There are totally 9 implicit objects,
		which are: 
			appication:	represents the Web applicaion in which the JSP page resides
			session: 	represents the HTTP session in which the client is participating
			request: 	represents the client request that invokes the JSP page
			pageContext: stores page-specific attributes
			response: 	represents the response that is returned to the client
			out: 		buffered output stream for returning content to the client
			config: 	contains configuration information relative to the JSP page servlet
			page:		represents an instance of the JSP page servlet
			exception:	represents an uncaught exception or error
	*/
	
	/* Comment No. 6
		To retrieve the form data the user inputted in index.html,
		we use the implicit object "request" and its 
		method "getParameter(XXX)". */
		
		String userId = request.getParameter("user_id");
		String pwd = request.getParameter("password");
%>


<!-- Comment No. 7
To verify the identity of the user, we need to retrieve data from 
database. Here we use the Java Bean "db.DBConnection" as in lab 3. 
To use a Java Bean in a JSP page, we use the JSP standard action/tag
"jsp:useBean". The "id" attribute of it specified the identifier/name 
of the Java Bean object created, the "class" attribute specifes the
fully qualified name of the Java Bean class, the "scope" attribute 
specifes which one of 4 valid scopes the Java Bean object is
stored in. 

The 4 valid scopes are "application", "session", "request" 
and "page".
-->

<jsp:useBean id="db" class="ecom.DBConnection" scope="session" />
<jsp:useBean id="user" class="ecom.UserInfo" scope="session" />


<%
	/* Comment No. 8
		Now we can use the Java Bean object in a scripting element.
		First, we get a connection to the database.
		*/
	
	Connection conn = db.getConnection(); 
	
	
	/* Comment No. 9
		Then we create a statement from the connection.
		For demonstration purpose, we use "java.sql.PreparedStatement" 
		rather than "java.sql. Statement". "PreparedStatement" provides
		more functions to help you construct a SQL statement in 
		multiple steps, say, so you can worry less about the syntax 
		of SQL statement. It also has better performance than "Statement"
		if you need to use a same SQL statement, but with different
		parameters, multiple times. Though, this is not needed here.
	*/
	
	PreparedStatement pstmt = conn.prepareStatement(
		"select * from student_info where user_id=? and password=?");
	
	pstmt.setString(1, userId);
	pstmt.setString(2, pwd);	
	
	ResultSet rs = pstmt.executeQuery();	
	
	
	/* Comment No. 10	
		Set the user bean properties if login is successful */
	if (rs.next()) {
		user.setLoggedIn(true);
		user.setUserId(rs.getString("user_id"));
		user.setFirstName(rs.getString("first_name"));
		user.setLastName(rs.getString("last_name"));
		user.setEmail(rs.getString("email"));
		user.setStream(rs.getString("stream"));
	} else {
		user.setLoggedIn(false);
	}	
	
	rs.close();
	pstmt.close();
	
	
	/* Comment No. 11
		Forward the request to "home.jsp" if login is successful,
		otherwise forward to "error.jsp". */
	String forwardURL = null;	
	if (user.isLoggedIn()) {
		forwardURL = "home.jsp";
	} else {
		forwardURL = "error.jsp";
	} 
%>

	<%-- Comment No. 12
		Here we use a scripting expression. The opening tag is "<%=",
		and the closing tag is "%>". --%>
		
<jsp:forward page="<%= forwardURL %>" />

