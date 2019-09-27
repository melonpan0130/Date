<%@page import="User.UserDAO"%>
<%@page import="comments.CommentDAO"%>
<%@page import="Board.BoardDAO"%>
<%@page import="Util.DB"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int boardid = Integer.parseInt(request.getParameter("boardid"));
	ResultSet rs = BoardDAO.getBoard(boardid);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Date</title>
		<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>
		<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
		<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.3.1/litera/bootstrap.min.css" rel="stylesheet" integrity="sha384-D/7uAka7uwterkSxa2LwZR7RJqH2X6jfmhkJ0vFPGUtPyBMF2WMq9S+f9Ik5jJu1" crossorigin="anonymous">
		<link rel="stylesheet" href="./bootstrap-datetime-picker/css/bootstrap.min.css">
		<link rel="stylesheet" href="./bootstrap-datetime-picker/css/shop-item.css">
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="../main.jsp">Date</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
				<%
					if(session.getAttribute("userEmail") == null){
						%>
					<li class="nav-item">
						<a class="nav-link" href="../0user/join.jsp">Join</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="../0user/login.jsp">Log in</a>
					</li>
						<%
					} else {
						%>
					<li class="nav-item">
						<a class="nav-link" href="0user/logout.jsp">Log out</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="0board/addEvent.jsp">Add Event</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<%= session.getAttribute("userEmail") %>
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a>
						<a class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
						</div>
					</li>
					<%
					}
				%>
				</ul>
				<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
		</nav>
		<div class="container" style="margin-top: 50px;">
			<div class="row">
				<div class="col-lg-3">
					<div class="list-group">
						<a href="#" class="list-group-item">
							<p>Volunteer<p>
							<div class="progress">
							  <div class="progress-bar bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</a>
						<a href="#" class="list-group-item">
							<p>Staff</p>
							<div class="progress">
							  <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</a>
						<a href="#" class="list-group-item">
							<p>Invite</p>
							<div class="progress">
							  <div class="progress-bar bg-warning" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-9">
						<div class="card mt-4">
						  <img class="card-img-top img-fluid" src="../images/cat.jpg" style="height:400px; width:900px; object-fit:cover" alt="">
						  <div class="card-body">
							<h3 class="card-title"><%= rs.getString("title") %></h3>
							<h4><%= rs.getTimestamp("starttime") %></h4>
							<p class="card-text"><%= rs.getString("content") %></p>
						  </div>
						</div>
						
						<!-- /.card -->
						
						<div class="card card-outline-secondary my-4">
						  <div class="card-header">
							Comments
							<form action="#" method="post">
								<input type="text" name="comment" id="comment">
								<input type="submit" value="SUBMIT">
							</form>
						  </div>
						  <div class="card-body">
						  
<%--						ResultSet comments = CommentDAO.viewComment(boardid);
						while(comments.next()) { --%>
							<p><%-- = comments.getString("content")--%></p>
							<small class="text-muted"><%-- = UserDAO.getUserName(comments.getInt("writerid")) --%></small>
							<hr>
<%--						}--%><a href="#" class="btn btn-success">Leave a Review</a>
							</div>
						</div>
						<!-- /.card -->
				</div>
			</div>
		</div>
	</body>
</html>