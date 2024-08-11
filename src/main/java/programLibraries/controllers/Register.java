package programLibraries.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setHeader("Content-Type", "application/json");
		
		if(
				request.getParameter("email") != null &&
				request.getParameter("password") != null
		) {
			
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			try {
				
				Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","C##JOSER","oracle");
				PreparedStatement ps = connection.prepareStatement("INSERT INTO REGISTRO VALUES(?,?)");
				ps.setString(1, email);
				ps.setString(2, password);
				
				int x = ps.executeUpdate();
				
				if(x != 0) {
					
				} else {
					System.out.println("error");
				}
				
			} catch(Exception e) {
				
				System.out.println(e);
			}
		}
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
