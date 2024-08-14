package programLibraries.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import programLibraries.Configuration;
import programLibraries.Validator;
import programLibraries.WebResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setHeader("Content-Type", "application/json");
		
		WebResponse webResponse = new WebResponse();
		webResponse.setStatus(false);
		webResponse.setContent("Error. Informacion no valida.");
		
		if(
				request.getParameter("email") != null &&
				Validator.isEmail(request.getParameter("email")) &&
				
				request.getParameter("password") != null
		) {
			
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			String query = "SELECT * FROM TBL_USUARIOS WHERE CORREO=? AND CONTRASENA=?";
			
			try {
				
				Connection connection = DriverManager.getConnection(Configuration.DATABASE_URL,Configuration.DATABASE_USERNAME,Configuration.DATABASE_PASSWORD);
				
				PreparedStatement ps = connection.prepareStatement(query);
				
				ps.setString(1, email);
				ps.setString(2, password);
				
				// System.out.println(String.format("%s, %s", email, password));
				
				ResultSet rs = ps.executeQuery();
				
				if(rs.next()){
					
					webResponse.setStatus(true);
					webResponse.setContent("Inicio de sesion exitoso.");
				}
				else{
					
					webResponse.setContent("Usuario no encontrado.");
				}
				
			} catch (Exception e) {
				
				System.out.println(e);
				
				webResponse.setContent("Error de base de datos.");
			}
		}
		
		// TODO Auto-generated method stub
		
		response.getWriter().append(webResponse.toJSON());
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
