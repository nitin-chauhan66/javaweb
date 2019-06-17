<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h1>JNet Wallet</h1>
<form method="get" action="loginprocess.jsp">
<table>
<tr>
<td>User Name : 
<td> <input type="text" name="Uname" required autofocus>
</tr>

<tr>
<td>Email : 
<td> <input type="email" name="Uemail" required>
</tr>
<tr>
<td>Password :
<td><input type="password" name="Upass" required></tr>
<tr>
<td>Confirm Password :
<td><input type="password" name="ConUpass" required></tr>
<tr>
<td>
<td><input type="submit" value="SignUp"></tr>
</table>
</form>
</div>
</body>
</html>