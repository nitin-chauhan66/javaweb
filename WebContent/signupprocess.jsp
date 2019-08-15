<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="javaweb.SignupDAO" %>
    <%@include file="menu.jsp" %>
<jsp:useBean id="obj" class="javaweb.UserBean" />
<jsp:setProperty property="*" name="obj"/>
<% 
int row =SignupDAO.validate(obj);
	if(row > 0){
	%>
	
	<div>
	<h3>You are Registered Successfully</h3>
	<a href="index.jsp"><button>Login Again</button></a>
	</div>	
	<%}
	else{
		out.println(" We are Facing some technical issue Please try later");
	}

%>