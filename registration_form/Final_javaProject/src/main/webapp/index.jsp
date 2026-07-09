<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="java.text.*" isELIgnored="false"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<HTML>
<HEAD>
<TITLE>Final Projec\4t</TITLE>
<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Calibri, sans-serif;
}

body{
    background:#f4f7fb;
    display:flex;
    flex-direction:column;
    align-items:center;
    padding:40px 20px;
    gap:30px;
}

/* ---------- FORM ---------- */

form{
    width:750px;
}

fieldset{
    background:#ffffff;
    border:2px solid #3498db;
    border-radius:10px;
    padding:30px;
    box-shadow:0 8px 20px rgba(0,0,0,0.15);
}

legend{
    color:#3498db;
    font-size:24px;
    font-weight:bold;
    padding:0 10px;
}

/* ---------- LABELS ---------- */

label{
    display:inline-block;
    width:180px;
    font-weight:bold;
    color:#333;
    margin-top:15px;
    vertical-align:middle;
}

/* ---------- INPUTS ---------- */

input,
select{
    width:300px;
    padding:10px;
    margin-top:12px;
    border:1px solid #ccc;
    border-radius:6px;
    font-size:15px;
    vertical-align:middle;
}

input:focus,
select:focus{
    outline:none;
    border-color:#3498db;
    box-shadow:0 0 6px rgba(52,152,219,.4);
}

/* ---------- CHECKBOX ---------- */

input[type="checkbox"]{
    width:auto;
    margin:0 8px;
    vertical-align:middle;
}

/* ---------- BUTTON ---------- */

input[type="submit"]{
    width:100%;
    padding:12px;
    margin-top:25px;
    background:#3498db;
    color:#fff;
    border:none;
    border-radius:6px;
    font-size:17px;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;
}

input[type="submit"]:hover{
    background:#2980b9;
}

/* ---------- HEADING ---------- */

h2{
    text-align:center;
    color:#2c3e50;
    margin:20px 0;
}

/* ---------- HORIZONTAL LINE ---------- */

hr{
    width:750px;
    border:none;
    border-top:2px solid #dcdcdc;
    margin:20px 0;
}

/* ---------- RESPONSIVE ---------- */

@media (max-width:800px){

    form{
        width:100%;
    }

    label{
        display:block;
        width:100%;
        margin-bottom:5px;
    }

    input,
    select{
        width:100%;
    }

    input[type="submit"]{
        width:100%;
    }
}
</style>
</HEAD>



<body>
<sql:setDataSource 
    var="myDS" 
    driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/final_project"
    user="root" 
    password="subha@2005" />

<form action = InsertStudent.jsp method ="get">
<fieldset>
<legend>Registration Form</legend>
<label>First Name : </label><input type="text" name="fname"  placeholder=" Enter your First Name... "  required><br>
<label>Last Name : </label><input type="text" name="lname"  placeholder=" Enter your Last Name... "  required><br>
<label>Age : </label><input type="number" name="age"  placeholder = "Enter your age" required  pattern="[0-9]{10}"
       maxlength="10"> <br>
<label>Qualification</label><select name=qualification>
<option value="Nil">Select your qualification...</option>
<option value="Sslc">10th-sslc</option>
<option value="Hsc">12th-Hsc</option>
<option value="UG"> Graduate</option>
<option value= "PG">Post Graduate</option></select><br>
<label>Role:</label><input type="text"  placeholder=" Enter your designation... "  name="role"><br>
<label>Phone Number:</label><input type="tel" name="phNo"  placeholder=" Enter your Phone Number... "  required><br>
<label>Join date:</label><input type="datetime-local" name="jDate"/><br>
<input type="submit">
</fieldset>
</form>
<!--  ===================================================================================================== -->


<form action="SelectStudent.jsp" method="GET">
<h2>click here to list Customers:</h2>
<input type="submit" value="click me">
</form>

<!--  ==================================================================================================== -->
<form action="UpdateStudent.jsp" method="POST">
<sql:query dataSource="${myDS}" var="myIds">
select cust_id from customer_details
</sql:query>
<label>Cust_id:</label><select name="custId">
<c:forEach var="row" items="${myIds.rows}">
<option value="${row.cust_id}">${row.cust_id}</option>
</c:forEach>
</select><br>
<label>Field:</label><input type="checkbox" name="myField" value="firstName">FirstName<input type="text" name="firstNameInput"><br>
<label>Field:</label><input type="checkbox" name="myField" value="lastName">lastName<input type="text" name="lastNameInput"><br>
<label>Field:</label><input type="checkbox" name="myField" value="age">Age:<input type="text" name="ageInput"><br>
<label>Field:</label><input type="checkbox" name="myField" value="role">Role:<input type="text" name="roleInput"><br>
<label>Field:</label><input type="checkbox" name="myField" value="phone_number">Phone_Number:<input type="text" name="phone_numberInput"><br>
<label>Field:</label><input type="checkbox" name="myField" value="join_date">Join Date:<input type="datetime-local" name="join_dateInput"><br>
<input type="submit" value="submit">
</form>
<!--  ==================================================================================================== -->

<form action="DeleteStudent.jsp" method="POST">
 <h2 align="center">Delete Customer</h2>

<label>Cust ID :</label>

<select name="myDeleteId">



<c:forEach var="row" items="${myIds.rows}">
    <option value="${row.cust_id}">
        ${row.cust_id}
    </option>
</c:forEach>

</select>

<br><br>

<input type="submit" value="Delete Customer">
</form>


</body>
</HTML>
