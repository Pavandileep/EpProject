

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class RejectMan extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	 
    public RejectMan() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out=response.getWriter();
		String s1=request.getParameter("empid");
		out.print("<p>'"+s1+"'</p>");
		
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Dileep");
			
			PreparedStatement ps=con.prepareStatement("delete from requestlist where emid=?");
			ps.setInt(1,Integer.parseInt(s1));
			ps.executeQuery();
			

			RequestDispatcher rs=request.getRequestDispatcher("Manager.jsp");
			rs.forward(request, response);

						
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
