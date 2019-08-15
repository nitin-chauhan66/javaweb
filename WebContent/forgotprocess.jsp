<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="javaweb.ForgotDAO" %>
    <%@include file="menu.jsp" %>
<jsp:useBean id="obj" class="javaweb.UserBean" />
<jsp:setProperty property="*" name="obj"/>
<%
int row =ForgotDAO.reset(obj);
	if(row >0){
		out.print("Reset Succesfully");
	}
	else{
		out.print("Something is wrong");
	}
%>