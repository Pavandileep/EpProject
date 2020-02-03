import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;

public class Input extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Input() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String s1=request.getParameter("ename");
		String s2=request.getParameter("eid");
		String s3=request.getParameter("mno");
		String s4=request.getParameter("emailid");
		String s5=request.getParameter("pass");
		String s6=request.getParameter("designation");
		try
		{
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Dileep");
			PreparedStatement ps=con.prepareStatement("insert into emprecords(ename,id,num,email,pass,desig) values(?,?,?,?,?,?)");
			ps.setString(1, s1);
			ps.setInt(2, Integer.parseInt(s2));
			ps.setString(3, s3);
			ps.setString(4, s4);
			ps.setString(5, s5);
			ps.setString(6, s6);
			ps.executeUpdate();
			con.close();
			response.sendRedirect("signup.html");
		
			
		}
		catch(Exception e)
		{
			out.print("Exception \n"+e);
			
		}
		
		

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		
	}

}
