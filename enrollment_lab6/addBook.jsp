
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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


<%@ taglib prefix='sql' uri='http://java.sun.com/jsp/jstl/sql' %>


<table width="63%" border="0">

  <tr> 
    <td width="16%" height="46">&nbsp;</td>
    <td width="73%" height="46"> 
      <p>&nbsp;</p>
      </td>
    <td width="11%" height="46">&nbsp;</td>
  </tr>

<%-- Comment No. 501
	Here we use another JSTL tags "choose", "when" and "otherwise"
	which allow us to perform tests and select only one of the 
	possible paths. --%>
<c:choose>

	<%-- Comment No. 502
		In Expression Langauge, we can test whether a string is
		null or empty by using the keyword "empty" before the tested
		string. --%>
 	<c:when test='${empty param.isbn}'>  
 	
	  <tr>
	    <td width="16%">&nbsp;</td>
	    <td width="73%" align="center">
	      No book is selected. <br>
	      <a href="browseBooks.jsp">Browse our catalog to select a book.</a>
	    </td>
	    <td width="11%">&nbsp;</td>
	  </tr>
  	</c:when>
  	
  	<c:otherwise>
  		
  		<%-- Comment No. 503
  			If the parameter "isbn" is not empty, we further check
  			against our database for its validity. If the value is
  			valid, we add the selected book to a "java.util.Vecotr"
  			object that holds all selected books. 
  			
  			As you can see below, the SQL statment inside the "query"
  			tag contains a question	mark '?' and there is also a child
  			tag "param" inside.	This is similar to the usage of 
  			"PreparedStatment" in lab 4, you can use '?' to represent
  			a parameter and set the parameter somewhere else. 
  			
  			We don't create a new DataSource object here, we use
  			the old DataSouce object created in "browseBooks.jsp".
  			We can do so because we set the scope of that DataSource
  			object to "session" when we created it. So we can refer to
  			the object using the same identifer "enrollmentDB". --%>
		<sql:query dataSource='${enrollmentDB}' var='books'>
			SELECT * FROM textbook WHERE isbn=?			
			<sql:param value='${param.isbn}'/>
		</sql:query>

		<c:choose>
			<c:when test='${books.rowCount == 0}'>
			
			  <tr>
			    <td width="16%">&nbsp;</td>
			    <td width="73%" align="center">
			      No book of ISBN "${param.isbn}" can be found. <br>
			      <a href="browseBooks.jsp">Browse our catalog to select a book.</a>
			    </td>
			    <td width="11%">&nbsp;</td>
			  </tr>		
			</c:when>
			
			<c:otherwise>	
				<%-- Comment No. 504
					If the flow goes here, we know the value of the 
					ISBN is valid, so we add the selected book to
					the "java.util.Vector" object which holds all
					selected books.
					
					First we retrieve the reference to the "Vector"
					object using the JSP standard action "useBean",
					then we retrieve the first row of the result
					of the query just performed and store the first
					row in a varaible called "book". Finally we add
					the first row to the "Vector" object. (Here we
					can't avoid using Java code in a scriptlet.)
						--%>							
				<jsp:useBean id="cart" class="java.util.Vector" scope="session" />
				<c:set var='book' value='${books.rows[0]}'/>		
				<% cart.add(pageContext.getAttribute("book")); %>
				
				 <tr> 
				    <td width="16%">&nbsp;</td>
				    <td width="73%"> 				     
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
				  
				  <tr> 
				    <td width="16%">&nbsp;</td>
				    <td width="73%" align="center"> 
				      <h4>This book is added succefully. Thank you! </h4>
				    </td>
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
				      <table width="100%" border="0">
				        <tr>
				          <td><a href="browseBooks.jsp">Add another book</a></td>
				          <td><a href="checkout.jsp">Checkout</a></td>
				        </tr>
				      </table>
				    </td>
				    <td width="11%">&nbsp;</td>
				  </tr>
			</c:otherwise>
		</c:choose>	
	</c:otherwise>

</c:choose>	

</table>
<p>&nbsp;</p>
</body>

</html>
