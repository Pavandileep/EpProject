import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;

public class LoginValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public LoginValidation() {
        super();
      
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String s1=request.getParameter("id");
		String s2=request.getParameter("pass");
		
		
		try
		{
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Dileep");
			PreparedStatement ps=con.prepareStatement("select desig from emprecords where id=? and pass=?");
			ps.setInt(1,Integer.parseInt(s1));
			ps.setString(2,s2);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) 
			{
				if(rs.getString(1).equalsIgnoreCase("EMP"))
				{
					request.setAttribute("id", s1);
					RequestDispatcher rd=request.getRequestDispatcher("EmpHome.jsp"); 
					rd.forward(request, response);
				}
					
				else if(rs.getString(1).equalsIgnoreCase("LEA"))
				{
					request.setAttribute("id", s1);
					RequestDispatcher rd=request.getRequestDispatcher("LeaderHome.jsp"); 
					rd.forward(request, response);
				}
					
				else if(rs.getString(1).equalsIgnoreCase("MAN"))
				{
					request.setAttribute("id", s1);
					RequestDispatcher rd=request.getRequestDispatcher("ManagerHome.jsp"); 
					rd.forward(request, response);
				}
					
			}
			else
			out.print("<p>Invalid Password</p>");
		
			
			
			
			con.close();
					
		}
		catch(Exception e)
		{
			out.print("Exception \n"+e);
			
		}
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
