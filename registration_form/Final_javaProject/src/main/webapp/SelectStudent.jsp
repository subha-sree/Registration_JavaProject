<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select Form</title>
</head>
<body>
<sql:setDataSource 
    var="myDS" 
    driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/final_project"
    user="root" 
    password="subha@2005" />
    
   <sql:query dataSource="${myDS}" var="Customer_details">
    SELECT * FROM Customer_details;
</sql:query>
    
    <H1>Following are the list of Customers:</H1>
<table border ="1">

<tr>
	<th>cust_id</th>
	<th>firstName</th>
	<th>lastName</th>
	<th> age</th>
	<th>qualification</th>
	<th>role</th>
	<th>Phone_Number</th>
	<th>join date</th>
</tr>

<c:choose>
    <c:when test="${not empty Customer_details.rows}">
        <c:forEach var="row" items="${Customer_details.rows}">
            <tr>
                <td>${row.cust_id}</td>
                <td>${row.firstName}</td>
                <td>${row.lastName}</td>
                <td>${row.age}</td>
                <td>${row.qualification}</td>
                <td>${row.role}</td>
                <td>${row.phone_number}</td>
                <td>${row.join_date}</td>
            </tr>
        </c:forEach>
    </c:when>

    <c:otherwise>
        <tr>
            <td colspan="8">No records found.</td>
        </tr>
    </c:otherwise>
</c:choose>

</table>
    
    
</body>
</html>