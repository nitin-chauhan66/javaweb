<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="javaweb.LoginDAO" %>
    <jsp:useBean id="obj" class="javaweb.UserBean" />
   <jsp:setProperty property="*" name="obj"/>

<%

boolean status = LoginDAO.validate(obj);

	if(status){
		out.println("You are Logged in successfully");
	}
	else{
		out.println("Email or password  Error!");
	}
%>
  