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
<body><% 
int cr=0;
int tfamt=0;
if((Boolean)session.getAttribute("flag")==true){
int amount = Integer.parseInt(request.getParameter("amount"));
String email = (String)request.getParameter("email");
String senderEmail = (String)session.getAttribute("email");
Connection con=DBconnect.getCon();
PreparedStatement ps=con.prepareStatement("select * from users where email =?");
ps.setString(1, senderEmail);
ResultSet rs=ps.executeQuery();
while(rs.next()){
 cr =rs.getInt(4)-amount;
}
if(cr>=0){
	ps=con.prepareStatement("update users set  credits=? where email=? ");
	ps.setInt(1, cr);
	ps.setString(2, senderEmail);
	ps.executeUpdate();
	ps= con.prepareStatement("select * from users where email=? ");
	ps.setString(1, email);
	rs=ps.executeQuery();
	while(rs.next()){
		tfamt=rs.getInt(4)+amount;
	}
	ps=con.prepareStatement("update users set  credits=? where email=? ");
	ps.setInt(1, tfamt);
	ps.setString(2, email);
	ps.executeUpdate();
	ps = con.prepareStatement("INSERT INTO transactions " +
            "VALUES (?, ?, ?,?)");
	ps.setInt(1, amount);
	ps.setString(2,senderEmail);
	ps.setString(3,email);
	ps.setString(4,null);
	ps.executeUpdate();
	out.println("Transaction successful");
}
else{
	out.println("Not enough Balance");
}

session.setAttribute("flag", false);
}
else{
	out.println("Please login agian");
}
%>

</body>
</html>