<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="javaweb.SignupDAO" %>
<jsp:useBean id="obj" class="javaweb.UserBean" />
<jsp:setProperty property="*" name="obj"/>
<% 
int row =SignupDAO.validate(obj);
	if(row>0){
		out.println("Yau are Reggistered Successfully");
	}
	else{
		out.println(" We are Facing some technical issue Please try later");
	}

%>