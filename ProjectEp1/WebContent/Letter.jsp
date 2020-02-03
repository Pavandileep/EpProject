<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<html>

	<html>
	<head>
		<title>Letter</title>
		
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
		
		#main
		{
			float:left;
			width:70%;
		}
		#sidebar-left
		{
			float:left;
			width:15%;
		}
		
		#sidebar-left, #main, #sidebar-right
		{
				min-height: 600px				
		}
		</style>
		
	</head>	
	<body >
	<%
		String s1=request.getParameter("id");
	%>



			<br><font color=white>
					<h1 style="background-color:#3b5998;">View Status</h1>
				</font>
			<hr>	

			<ul class="topnavig">
				<li><a class="active" href="EmpHome.jsp?id=<%=s1 %>">Home</a></l>
				<li><a href="#news">News</a></li>
				<li class="right"><a href="#about">About</a></li>
				<li class="right"><a href="Employee.jsp?id=<%=s1 %>">Request For leave</a></li>
				<li class="right" style="float:right"><a href="login.html">LogOut</a></li>
			
			</ul>
			
			
			<%
				try 
				{
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Dileep");
					PreparedStatement ps=con.prepareStatement("select * from requestlist where emid=?");
					ps.setInt(1,Integer.parseInt(s1));
					ResultSet rs=ps.executeQuery();
					if(rs.next())
					{
					%>				
						<h1 align="center">LEAVE LETTER</h1>
						<h3 align="right">Date  <%= (new java.util.Date()).toLocaleString()%></h3>
						<h3 align="right">Place:Vijayawada</h3>
						<h3 align="left">To</h3>
						<h3 align="left">Mr <%=rs.getString(1)%></h3>
						<h3 align="middle">This is with reference to  your request letter received regarding permission to take leave. We are pleased to inform you that your request has been accepted and the company hereby given permission to <%=rs.getString(1) %> for the given reason <%=rs.getString(5) %></h3>
						
						
											<%
					}
					
				}
				catch(Exception e)
				{
					out.print("Exception "+e);		
				}
			
		%>


		<br><br><br>
	
		
	

</body>

</html>

					