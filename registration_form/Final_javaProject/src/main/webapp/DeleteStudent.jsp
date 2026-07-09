<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.*" isELIgnored="false"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Form</title>

</head>
<body>

<%
int id=Integer.parseInt(request.getParameter("myDeleteId"));

%>
<sql:setDataSource var="myDB" 
driver="com.mysql.cj.jdbc.Driver" 
url="jdbc:mysql://localhost:3306/final_project"
 user="root" 
 password="subha@2005"/>
<sql:update dataSource="${myDB}" var="count">
delete from customer_details where cust_id=?
<sql:param value="<%=id%>"></sql:param>
</sql:update>

<div id="output">
<H1>Record deleted Successfully</H1>
<button onclick="history.back()">Go Back</button>
</div>

</body>
</html>