

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class EmpValidaton extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public EmpValidaton() 
    {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String s1=request.getParameter("ename");
		String s2=request.getParameter("empid");
		String s3=request.getParameter("toid");
		String s4=request.getParameter("sub");
		String s5=request.getParameter("query");
		String s6=request.getParameter("id");
		if(s6.equals(s2))
		{
		
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Dileep");
			PreparedStatement ps=con.prepareStatement("insert into requestlist values(?,?,?,?,?,?)");
			ps.setString(1, s1);
			ps.setInt(2, Integer.parseInt(s2));
			ps.setInt(3, Integer.parseInt(s3));
			ps.setString(4, s4);
			ps.setString(5, s5);
			ps.setInt(6,0);
			ps.executeUpdate();
			out.print("Successfully Updated");
			out.print("<br><a href=EmpHome.jsp?id="+s6+"><button>GoBack</button></a>");
		}
		
		catch(Exception e)
		{
			out.print("Exception \n"+e);
		}
		}
		else
		{
			out.print("Invalid email");
			response.sendRedirect("Employee.jsp?id="+s6);
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}


