<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="javaweb.LoginDAO" %>
    <jsp:useBean id="obj" class="javaweb.UserBean" />
   <jsp:setProperty property="*" name="obj"/>

<%

boolean status = LoginDAO.validate(obj);

	if(status){
		session.setAttribute("email", obj.getEmail());
		response.sendRedirect("userprofile.jsp");
		
	}
	else{
		out.println("Email or password  Error!");
		%>
		<a href='index.jsp'><button>Try Again</button></a>
		
		
		
		<% 
	}
%>
  