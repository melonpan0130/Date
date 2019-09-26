<%@page import="java.io.PrintWriter"%>
<%@page import="User.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="User.UserDTO" />
<jsp:setProperty name="member" property="*"/>
<%
	int result = UserDAO.login(member.getEmail(), member.getPw());
	PrintWriter script = response.getWriter();
	script.println("<script>");
	if(result == 0){
		session.setAttribute("userEmail", member.getEmail());
		script.println("location.href='../main.jsp'");
	}
	else{
		script.println("location.href='login.jsp'");
		if(result == 1)
			script.println("alert('비밀번호를 틀렸습니다.')");
		else if(result == 2)
			script.println("alert('존재하지 않는 이메일 입니다.')");
	}
	script.println("</script>");
%>