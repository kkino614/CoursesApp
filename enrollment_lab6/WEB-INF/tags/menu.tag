

<%-- Comment No. 601
	In a tag file, there are 3 new directives available for
	specifying properties of the custom tag handled by the tag file.
	These 3 new directives are:
		'tag'		this directive has the similar meaning as the 'page' directive in a JSP page
		'attribute' this directive is for specifying information of the attributes of the custom tag
		'variable' 	this directive is for specifying information about the variables exposed by the custom tag
	
	In this tag file, we only used the two directives 'tag' and 
	'attribute'. We will use the directive 'variable' when we need 
	to make some data created in a tag file accessible within the 
	JSP page that uses the custom tag, i.e. we can use scriptlet
	, scripting expression or Expression Language in the calling 
	JSP page to access some data object created or modified in 
	the tag file.
	
	You may interpret the attributes of a tag as pass-in parameters 
	to the tag, and the variables exposed by the tag as pass-out 
	parameters to the calling JSP page.	
--%>


<%-- Comment No. 602
	First, we need to specify the type of the body content of 
	the custom tag. We use the attribute 'body-content' of the
	directive 'tag' to do this. 
	
	There are 3 valid values for the attributes, which are 'empty'
	, 'scriptless' and 'tagdependent'. 
	
	'empty' means there is no body for the custom tag.
	'scriptless' means no scriptlet or scripting expression can be
		used in the body of the custom tag. (But the use of Expression
		Language is allowed)
	'tagdependent' means the web container won't check the validity
		of the body content, the work is left to the custom tag.		
	--%>
	
<%@ tag body-content='empty' %>



<%-- Comment No. 603
	Here we use the directive 'attribute' to specify the attributes
	of the custom tag. The attribute 'name' of the directive specifies
	the name of an attribute of the custom tag, the attribute 
	'required' specifies whether it is required or not.
	
	There are other attributs of the directive, one of them is 'type'.
	You can use it to specify the type, i.e. the name of the Java class,
	of an attribute of the custom tag. The default value for 'type' is
	'java.lang.String'.
	
	For this custom tag, there are 4 attributes. 
	
	attribute 'items': 	stores a list of menu item strings; 
	attribute 'links': 	stores the corresponding list of the URL links of the menu items; 
	attribute 'delims': stores the demiliter character used in the string values of the attributes 'items' and 'links'; 
	attribute 'current': stores the menu item string that corresponds to current page the visitor is viewing.
--%>

<%@ attribute name='items' required='false' %>
<%@ attribute name='links' required='false' %>
<%@ attribute name='delims' required='false' %>
<%@ attribute name='current' required='false' %>


<%--Comment No. 604
	In a tag file, we can use the JSP Standard Tag Library as we do
	in a JSP page. Actually, almost all the facilities available in
	JSP page are avaialbe in tag file. You can use scriptlet, scripting
	expression, Expression Language and JSP standard actions, and 
	access the implicit objects in a tag file. You may consider a
	tag file as an ordinary JSP page with the effect that its output
	will replaces the occurrence of the custom tag handled by it in
	the JSP page uses the custom tag.	
	 --%>
	 
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>


<%--Comment No. 605
	Here, we set the default values for the attributes.
--%>
<c:if test='${empty items}'>
<c:set var='items'
 value='Home|Add Course|Drop Course|Browse
Textbooks|Logout' />
<c:set var='links'

value='home.jsp|addCourse.jsp|dropCourse.jsp|browseBooks.jsp|lo
gout.jsp' />
<c:set var='delims' value='|' />
</c:if>
<c:if test='${empty delims}'>
<c:set var='delims' value='|' />
</c:if>


<%--Comment No. 606
	Then we iterate over the list of the menu items, display them
	one by one. If a menu item corresponds to the current page, 
	its color will be changed to red.
--%>
<c:forTokens var='item' items='${items}' delims='${delims}' varStatus='loopStatus' >
	<c:set var='link'>
		<c:forTokens var='lk' items='${links}' delims='${delims}' begin='${loopStatus.index}' end='${loopStatus.index}' >
			<c:out value='${lk}' />
		</c:forTokens>
	</c:set>
	
	<c:choose>
		<c:when test='${item eq current}' >
			<%--Comment No. 606.1 --%>
			<font color="#ffffff">|</font>
			<B>
				<a class="menu" href="${link}">
				<font color="#aa0000">${item}</font>
				</a>
			</B>
		</c:when> 
		<c:otherwise>
			<%--Comment No. 606.2 --%>
			<font color="#ffffff">|</font>
			<B>
				<a class="menu" href="${link}">
				${item}
			</a>
			</B>
		</c:otherwise>
	</c:choose>
</c:forTokens>


