<%@page import="java.io.PrintWriter"%>
<%@page import="User.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="User.UserDTO" />
<jsp:setProperty name="member" property="*" />
<%
	int result = UserDAO.join(member);
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("location.href='login.jsp'");
	if(result != 1)
		script.println("alert('DB error')");
	script.println("</script>");
%>