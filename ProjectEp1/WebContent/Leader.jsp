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
					<h1 style="background-color:#3b5998;">View Request</h1>
				</font>
			<hr>	

			<ul class="topnavig">
				<li><a class="active" href="LeaderHome.jsp?id=<%=s1%>">Home</a></l>
				<li><a href="#news">News</a></li>
				<li class="right"><a href="#about">About</a></li>
				<li class="right" style="float:right"><a href="login.html">LogOut</a></li>
			
			</ul>
			<br><br><br>

<center>
<%




try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Dileep");
	
	PreparedStatement ps=con.prepareStatement("select emid,sub,query,accept from requestlist where toid=?");
	ps.setInt(1,Integer.parseInt(s1));
	ResultSet rs=ps.executeQuery();
	out.print("<div class=\"container\">");
	out.print("<center>");
	out.print("<table border=true >");
	out.print("<tr>");
	out.println("<th>EMPID</th>");
	out.println("<th>SUB</th>");
	out.println("<th>QUERY</th>");
	out.println("<th>ACCEPT</th>");
	out.println("<th>REJECT</th>");
	out.print("</tr>");
	while(rs.next())
	{
		if(rs.getInt(4) != 1 && rs.getInt(4)!=2)
		{
		out.print("<tr>");
			out.println("<td>"+rs.getInt(1)+"</td>");
			out.println("<td>"+rs.getString(2)+"</td>");
			out.println("<td>"+rs.getString(3)+"</td>");
			out.println("<td><form action=Accept><input type=hidden name=empid value='"+rs.getInt(1)+"'><input type=hidden name=id value='"+s1+"'><input type=submit value=&#x2705;></form></td>");
			out.println("<td><form action=Reject><input type=hidden name=empid value='"+rs.getInt(1)+"'><input type=hidden name=id value='"+s1+"'><input type=submit value=&#10060></form></td>");
		out.print("</tr>");
		}				
			
			
	}
	out.print("</table>");
	out.print("</center></div>");
}
catch(Exception e)
{
	e.printStackTrace();
}



%>

</center>
</body>
</html>