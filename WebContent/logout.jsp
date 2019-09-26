<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	session.setAttribute("userEmail", null);
	PrintWriter script = response.getWriter();
	script.println("<script>location.href='main.jsp'; alert('로그아웃 되었습니다.');</script>");
%>