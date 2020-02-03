<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Leader Module</title>
		<style>
		div.fixed {
 			position: fixed;
  			width: 20%;
			bottom: 10px;
			border: 3px solid black;
			color: red;
		}
		* {box-sizing: border-box;}
		body {margin: 25px;}
		.dropdown:hover .dropdown-content {
  			display: block;
		}

		.dropdown-content a:hover {
				  background-color: green;
			}	
		ul.topnavig
		{
			list-style-type: none;
			margin: 0;
			padding: 0;
			overflow: hidden;
			background-color: grey;
		}
		ul.topnavig li{
			float: left;
		}
		ul.topnavig li a {
  			display: block;
			color: white;
			text-align: center;
 			padding: 14px 16px;
			text-decoration: none;
		}

		ul.topnav li a:hover:not(.active) {background-color: #111;}
		ul.topnav li a.active {background-color: #4CAF50;}
		ul.topnav li.right {float: right;}

		@media screen and (max-width: 600px) {
			  ul.topnav li.right, 
			  ul.topnav li {float: none;
			}
		}
		li a:hover, .dropdown:hover .dropbtn {
  		background-color: green;
		}





		.container {
 			border-radius: 5px;
 			background-color: #3636;
  			padding: 20px;
			width: 55%;
			}


		.input{
			width: 60%;
 			padding: 12px;
 			border: 1px solid #ccc;
  			border-radius: 4px;
  			box-sizing: border-box;
  			margin-top: 10px;
  			margin-bottom: 16px;
  			resize: vertical;
			cursor: pointer;
		}.query{
			width: 60%;
 			padding: 12px;
 			border: 1px solid #ccc;
  			border-radius: 4px;
  			box-sizing: border-box;
  			margin-top: 10px;
  			margin-bottom: 16px;
  			resize: vertical;
			cursor: pointer;
		}
		.submit
		{
			background-color: #32CD32;
			box-sizing: border-box;
			padding: 20px;
			border-radius: 25px;
			cursor: pointer;
			border: 2px solid black;
		}
		input[type=submit]:hover{ background-color: #00FF00;}
		</style>


</head>
<body>
<%

String s1=request.getParameter("id");

%>
<br><font color=white>
					<h1 style="background-color:#3b5998;">Leader Page</h1>
				</font>
			<hr>	

			<ul class="topnavig">
				<li><a class="active" href="LeaderHome.jsp?id=<%=s1 %>">Home</a></l>
				<li><a href="#news">News</a></li>
				<li class="right"><a href="#about">About</a></li>
				<li class="right"><a href="Leader.jsp?id=<%=s1 %>">View Requests</a></li>
				<li class="right" style="float:right"><a href="login.html">LogOut</a></li>
			
			</ul>
			<br><br><br>
			<center>
			<h1><%="Hello Mr"+s1 %></h1>
			<img src='https://cdn2.iconfinder.com/data/icons/leadership-and-team/273/team-teamwork-teammate-001-512.png' height=200px width=200px><br><br>
			
			</center>




</body>
</html>