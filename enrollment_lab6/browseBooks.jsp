
<%-- Comment No. 501 
	To use "core" tags of the JSP Standard Tag Library, 
	we have to first use the directive "taglib" to inform the 
	web container the identity of the tag library containing those tags. 
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%-- Comment No. 502
	Then we check whether the user has logged in. 
	
	Here we use 
	the conditional tag "if" in the core tag library instead of
	scriptlet that we used in lab 4. 
	
	We also use Expression Language (EL) to set the value of the attribute
	"test" of the "if" tag. An EL expression is enclosed by 
	"${" and "}".  --%>

<jsp:useBean id="user" class="ecom.UserInfo" scope="session" />

<c:if test='${not user.loggedIn}'>  
	<jsp:forward page='error.jsp'/>
</c:if>


<html>

<head>
	<link href="style.css" rel="stylesheet" type="text/css">
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
        <my:menu current='Browse Textbooks'/>  
		</td>
	</tr>
</table>


<%-- Comment No. 503 
	Then we make use of the "sql" tags in the JSP Standard Tag Library 
	to retrieve the textbook data from the database server.
	
	First, we have to inform the web container the tag library we
	want to use via the "taglib" directive.
--%>

<%@ taglib prefix='sql' uri='http://java.sun.com/jsp/jstl/sql' %>


<%-- Comment No. 504 	
	Second, we create a DataSource that represent your database in
	the MySQL database server. 
	
	To do this, we use the tag "setDataSource" in the "sql" tag library.
--%>

<sql:setDataSource
 		driver='com.mysql.jdbc.Driver'
 		url='jdbc:mysql://honest.cs.hku.hk:59040/ecdb040'		
 		user='ecom040'		
 		password='BKTfWeii'		
 		var='enrollmentDB'		
 		scope='session'
/>			

<%-- Comment No. 505 	
	Finally, we we use the tag "query" in the "sql" tag library to
	retrieve the required data from your database using the created 
	DataSource object. 
	
	The result of the query will be stored in 
	an object of the type "javax.servlet.jsp.jstl.sql.Result". The
	variable identifier for the object is the value of 
	the attribute "var" of the tag.
--%>

<sql:query dataSource='${enrollmentDB}' var='books'>
	SELECT * FROM textbook
</sql:query>


<table width="63%" border="0">
  <tr> 
    <td width="16%" height="46">&nbsp;</td>
    <td width="73%" height="46"> 
      <p>&nbsp;</p>
      </td>
    <td width="11%" height="46">&nbsp;</td>
  </tr>


<%-- Comment No. 506.1
	Now we use the tag "forEach" to iterate over the query result
	row by row and print out the values.
	
	The value of the attribute 'var' of the tag sets the identifier 
	of the variable that stores the extracted row from the query
	result in each iteration.
--%>  

<c:forEach var='book' items='${books.rows}'>

  <tr> 
    <td width="16%">&nbsp;</td>
    <td width="73%"> 
      <form action="addBook.jsp">
        <input type="hidden" name="isbn" value="${book.ISBN}">
        <table width="352" border="1">
        <tr> 
          <td colspan="3"> 
            <h3>${book.Title}<br>
            </h3>
          </td>
        </tr>
        <tr> 
          <td colspan="3"> 
            <p>by ${book.Authors}<br>
            </p>
          </td>
        </tr>
        <tr> 
          <td rowspan="3" width="144"><img src="images/${book.Cover}" width="133" height="154"></td>
          <td width="90">Publisher: </td>
          <td width="96">${book.Publisher}</td>
        </tr>
        <tr> 
          <td width="90">ISBN:</td>
          <td width="96">${book.ISBN}</td>
        </tr>
        <tr> 
          <td width="90">Price:</td>
          <td width="96">$ ${book.Price}</td>
        </tr>
        <tr> 
          <td width="144">&nbsp;</td>
          <td colspan="100">
              <input type="submit" name="Submit" value="Add this book">
            </td>
        </tr>
      </table>
	  </form>	
    </td>
    <td width="11%">&nbsp;</td>
  </tr>
  <tr> 
    <td width="16%">&nbsp;</td>
    <td width="73%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
  </tr>
  
<%-- Comment No. 506.2 --%>  
</c:forEach>
 
 
  <tr> 
    <td width="16%">&nbsp;</td>
    <td width="73%">&nbsp;</td>
    <td width="11%">&nbsp;</td>
  </tr>
  <tr> 
    <td width="16%">&nbsp;</td>
    <td width="73%" align="center">&nbsp;</td>
    <td width="11%">&nbsp;</td>
  </tr>
  <tr>
    <td width="16%">&nbsp;</td>
    <td width="73%" align="center">
      <h4><a href="checkout.jsp">Confirm your order</a></h4>
    </td>
    <td width="11%">&nbsp;</td>
  </tr>
</table>
<p>&nbsp;</p>
</body>

</html>
