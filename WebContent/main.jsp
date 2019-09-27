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
		<script type="text/javascript">
			window.onload = function() {
				
			}
		</script>
	</head>
	<body>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="#">Date</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
				<%
					if(session.getAttribute("userEmail") == null){
						%>
					<li class="nav-item">
						<a class="nav-link" href="0user/join.jsp">Join</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="0user/login.jsp">Log in</a>
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
		<div class="album py-5 bg-light">
			<div class="container">
				<div class="row">
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		conn = DB.getConnection();
		String sql = "SELECT * FROM BOARD ORDER BY boardid DESC";
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			%>
			<a class="col-md-4" href="./0board/viewEvent.jsp?boardid=<%= rs.getInt("boardid")%>" >
				<div class="card mb-4 shadow-sm">
					<%if(rs.getBlob("mainimg") != null){%>
						<img class="bd-placeholder-img card-img-top" width="100%" height="225" />
				<%	} else { %>
						<img src="./images/cat.png" width="100%" height="225" border="1"/>
						<!-- 0svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>-->
				<%	} %>
					<div class="card-body">
						<p class="card-text"><%= rs.getString("title") %></p>
						<div class="d-flex justify-content-between align-items-center">
							<div class="btn-group">
							<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
							<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
							</div>
						</div>
					</div>
				</div>
			</a>
			<%
		}
	}catch(Exception e) {
		e.printStackTrace();
	}finally {
		if(rs != null) try{ rs.close(); }catch(Exception e) { e.printStackTrace(); }
		if(pstmt != null) try{ pstmt.close(); }catch(Exception e) { e.printStackTrace(); }
		if(conn != null) try{ conn.close(); }catch(Exception e) { e.printStackTrace(); }
	}
%>
				</div>
			</div>
		</div>


	</body>
</html>