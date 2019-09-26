<%@page import="User.UserDAO"%>
<%@page import="Board.BoardDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="Board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String start = request.getParameter("starttime");
	String end = request.getParameter("endtime");
	String content = request.getParameter("content");
	byte[] mainimg = request.getParameter("mainimg").getBytes();
	
	start += ":00.0";
	end += ":00.0";
	Timestamp starttime = Timestamp.valueOf(start.replace("T", " "));
	Timestamp endtime = Timestamp.valueOf(end.replace("T", " "));
	String userEmail = (String)session.getAttribute("userEmail");
	
	BoardDTO board = new BoardDTO();
	board.setUserid(UserDAO.getUserId(userEmail));
	board.setTitle(title);
	board.setStarttime(starttime);
	board.setEndtime(endtime);
	board.setContent(content);
	board.setMainimg(mainimg);
	
	int result = BoardDAO.newBoard(board);
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	if(result == 1){
		script.println("location.href='../main.jsp'");
		script.println("alert('이벤트가 등록되었습니다.')");
	}
	else{
		script.println("location.href='addEvent.jsp'");
		script.println("alert('DB error')");
	}
	script.println("</script>");
%>