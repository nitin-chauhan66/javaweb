<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import ="javaweb.*" %>
     <%@ page import ="java.sql.*" %>
     <%@include file="menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<%
Connection con=DBconnect.getCon();
PreparedStatement ps=con.prepareStatement("select * from transactions order by time desc");
ResultSet rs=ps.executeQuery();%>
<table border="1">
<caption>Recent transactions</caption>
<tr>
<th>Amount Transfered
<th>Sender Address
<th>Receiver Address
<th>Date/Time
</tr>
<%
while(rs.next()){
%>
	<tr>
	<td><%=rs.getString(1) %>
	<td><%=rs.getString(2) %>
	<td><%=rs.getString(3) %>
	<td><%=rs.getString(4) %>
	</tr>
<%}
%>
</table>
</div>
</body>
</html>