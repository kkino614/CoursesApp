
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


<table width="63%" border="0">

  <tr> 
    <td width="16%" height="46">&nbsp;</td>
    <td width="73%" height="46"> 
      <p>&nbsp;</p>
      </td>
    <td width="11%" height="46">&nbsp;</td>
  </tr>

<%-- Comment No. 501
	First, we retrieve the reference to the "Vector" object which
	holds all selected books. --%>
<jsp:useBean id="cart" class="java.util.Vector" scope="session" />

<c:choose>
	
 	<c:when test='<%= cart.size() == 0 %>'>  
 	
	  <tr>
	    <td width="16%">&nbsp;</td>
	    <td width="73%">
	      You haven't selected any book. <br>
	      No need to checkout. Thank you! <br>
	    </td>
	    <td width="11%">&nbsp;</td>
	  </tr>
  	</c:when>
  	
  	<c:otherwise>
  		<tr> 
		    <td width="16%">&nbsp;</td>
		    <td width="78%"> 
		      <h4>You have added the following books:</h4>
		    </td>
		    <td width="6%">&nbsp;</td>
		  </tr>
		  <tr> 
		    <td width="16%" height="25">&nbsp;</td>
		    <td width="78%" height="25">&nbsp;</td>
		    <td width="6%" height="25">&nbsp;</td>
		 </tr>
		 
		 <tr> 
		    <td width="16%">&nbsp;</td>
		    <td width="78%" align="center"> 
		      <table width="100%" border="1">
		        <tr> 
		          <td width="70%" bgcolor="#ffffff">Title</td>
		          <td width="30%" bgcolor="#ffffff" align="center">Price</td>
		        </tr>		        
		
		<%-- Comment No. 502
			Then we create a new variable which represents the
			total amount of prices of the selected books. --%>			
		<c:set var='totalAmount' value='<%= new Float(0) %>' />
		
		
		<%-- Comment No. 503.1
			Finally we use the tag "forEach" to display the list
			of selected books. 	--%>
		<%@ taglib prefix='bs' uri='/bookstore-taglib' %>
		<bs:showCart var='book' cart='${cart}'>
				<tr> 
          			<td width="70%" bgcolor="#cccccc">${book.title}</td>
          			<td width="30%" bgcolor="#cccccc" align="right">$ ${book.price}</td>          			
        		</tr>	
        		<%-- Comment No. 504 
        			We use the capability of arithmetic operation of
        			Expression Language to sum up the prices --%>
        		<c:set var='totalAmount' value='${totalAmount + book.price}' />
        		
        <%-- Comment No. 503.2 --%>		
        </bs:showCart>
        
			 </table>
			</td>
		    <td width="6%">&nbsp;</td>
		  </tr>
		  <tr> 
		    <td width="16%">&nbsp;</td>
		    <td width="78%" align="right">&nbsp;</td>
		    <td width="6%">&nbsp;</td>
		  </tr>
		  <tr> 
		    <td width="16%">&nbsp;</td>
		    <td width="78%" align="right">Total: $ ${totalAmount} </td>
		    <td width="6%">&nbsp;</td>
		  </tr>
		  <tr> 
		    <td width="16%">&nbsp;</td>
		    <td width="78%" align="right">&nbsp;</td>
		    <td width="6%">&nbsp;</td>
		  </tr>
		  <tr>
		    <td width="16%">&nbsp;</td>
		    <td width="78%" align="center">
		      <h4><a href="completeOrder.jsp">Complete your order</a></h4>
		    </td>
		    <td width="6%">&nbsp;</td>
		  </tr>
		  
	</c:otherwise>
	
</c:choose>			  

</table>
<p>&nbsp;</p>
</body>

</html>
