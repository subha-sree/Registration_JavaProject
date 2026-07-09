<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.*" isELIgnored="false"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Form</title>

</head>
<body>

<%int myKey=Integer.parseInt(request.getParameter("custId")); 
String[] myFieldArray=request.getParameterValues("myField");
String myUpdateQuery="update customer_details set ";
for(int i=0;i<myFieldArray.length;i++)
{
	if(i<myFieldArray.length-1)
	{
	myUpdateQuery+=myFieldArray[i]+"=?,";
	}
	else
	{
		myUpdateQuery+=myFieldArray[i]+"=? where cust_id=?";
	}
}
%>
<H1><%=myUpdateQuery%></H1>


<c:set var="myQuery" value="<%=myUpdateQuery%>"/>
<c:set var="myKey" value="<%=myKey%>"/>

<sql:setDataSource var="myDB" 
driver="com.mysql.cj.jdbc.Driver" 
url="jdbc:mysql://localhost:3306/final_project" 
user="root"
 password="subha@2005"/>
 
<sql:update dataSource="${myDB}" var="count">

<c:out value="${myQuery}">
</c:out>

<%for(int k=0;k<myFieldArray.length;k++)
{
String fieldName=myFieldArray[k]+"Input";
if(myFieldArray[k].equals("age"))
{
	int ageValue=Integer.parseInt(request.getParameter(fieldName));%>
	<sql:param value="<%=ageValue%>"/>
<%}
else if(myFieldArray[k].equals("join_date"))
{
	SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
	java.util.Date joinDate=null;
	try
	{
		joinDate=s.parse(request.getParameter(fieldName));
	}
	catch(ParseException pe)
	{
		pe.printStackTrace();
	}%>
	
	<sql:param value="<%=joinDate%>"/>
	
 <% }

else
{
	String myValue=request.getParameter(fieldName);%>
	<sql:param value="<%=myValue%>"/>
<%}
}%>
<sql:param value="${myKey}"/>
</sql:update>

<div id="output">
<H1>Record updated Successfully</H1>
<button onclick="history.back()">Go Back</button>
</div> 



</body>
</html>