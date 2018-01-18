
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


<table width="80%" border="0">

  <tr> 
    <td width="16%" height="46">&nbsp;</td>
    <td width="73%" height="46"> 
      <p>&nbsp;</p>
      </td>
    <td width="11%" height="46">&nbsp;</td>
  </tr>

  <tr>
    <td width="16%">&nbsp;</td>
    <td width="73%">
      <b>"Complete Order" is not implemented in this lab.</b>
      <p>
      In your project, when you are implementing this function,
      you should tackle the case that multiple copies of 
      a same book are ordered.
    </td>
    <td width="11%">&nbsp;</td>
  </tr>
   
</table>
<p>&nbsp;</p>
</body>

</html>
