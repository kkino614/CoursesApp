
<!-- Comment No. 1 
	To log out the system, it is very simple. We just set
	the "loggedIn" bean property of "UserInfo" to be false. 
	Here we use another JSP standard action "jsp:setProperty". 
	The value of the "name" attribute should be same as that
	of the "id" attribute of "jsp:useBean". -->
	
<jsp:useBean id="user" scope="session" class="ecom.UserInfo" />
<jsp:setProperty name="user" property="loggedIn" value="false" />

<jsp:forward page="index.jsp" />

	