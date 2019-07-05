<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import ="java.sql.*" %>
   <%@ page import ="javaweb.DBconnect" %>
   <%@ page import ="javaweb.*" %>
   <jsp:useBean id="obj" class="javaweb.UserBean" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<style>
.table1{
	width: 50%;
	}

table {
    width: 100%;
    border-collapse: collapse;
}

table, td, th {
    border: 1px solid black;
    padding: 5px;
}

th {text-align: left;}
</style>
</head>
<body>
<div align="center">
<%
session.setAttribute("flag", true);
String email = (String)session.getAttribute("email");
Connection con=DBconnect.getCon();
PreparedStatement ps=con.prepareStatement(  
	    "select * from users where email= ? ");
ps.setString(1,email);
ResultSet rs=ps.executeQuery(); 
%>
<h1>User Profile</h1>
<table>
<tr>
<th>User Name </th>
<th>Email </th>
<th>Credits</th>
</tr>
<% 

while(rs.next()){%>
	<tr>
	<td><%=rs.getString(1)%>
	<td><%=rs.getString(3) %>
	<td><%=rs.getString(4) %>
	</tr><% 
	
}
%>
</table>
<%

 ps=con.prepareStatement("select * from users");
 rs=ps.executeQuery(); %>
 <form action="transcation.jsp" name="f1" method="post">
 <h3>Select a User</h3>
<table>
<tr>
<th>Select</th>
<th>Name </th>
<th>Email </th>
</tr>
<%
while(rs.next()){%>
<tr>
	<td><input type="radio" name="email" value="<%=rs.getString(3) %>">
<td><%=rs.getString(1)%>
<td><%=rs.getString(3) %>
</tr><% 

}
%>
</table>
<hr>
Enter amount to Transfer :
<input type="number"  name="amount" required min=1 step=1>
<input type="Submit" value="Transfer">	
</form>
</div>
</body>
</html>