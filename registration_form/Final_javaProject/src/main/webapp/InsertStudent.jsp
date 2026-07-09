<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.text.*" isELIgnored="false"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Form</title>
</head>
<body>
<sql:setDataSource 
    var="myDS" 
    driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/final_project"
    user="root" 
    password="subha@2005" />
    
<%
  String fName=request.getParameter("fname");
  String lName=request.getParameter("lname");
 
  int age=Integer.parseInt(request.getParameter("age"));
  String qualification=request.getParameter("qualification");
  String role=request.getParameter("role");
  String phNo=request.getParameter("phNo");
  String jDate=request.getParameter("jDate");
  
  SimpleDateFormat sd=new SimpleDateFormat("yyyy-MM-dd'T'hh:mm");
  
  
  
  java.sql.Date sDate=null;
  try
  {
	 java.util.Date uDate=sd.parse(jDate);
	 
	 sDate=new java.sql.Date(uDate.getTime());
	  
  }
  catch(ParseException pe)
  {
	  pe.printStackTrace();
  }
 
  %>  
  <sql:update dataSource="${myDS}" var="num">
    insert into Customer_details(firstName,lastName,age,qualification,role,phone_number,join_date) values (?,?,?,?,?,?,?)
    
    <sql:param value="<%=fName%>"/>
    <sql:param value="<%=lName%>"/>
     <sql:param value="<%=age%>"/>
    <sql:param value="<%=qualification%>"/>
    <sql:param value="<%=role%>"/>
    <sql:param value="<%=phNo%>"/>
    <sql:param value="<%=sDate%>"/>
</sql:update>
  <H1>The Number of records inserted in the Table is ${num}</H1>
</body>
</html>