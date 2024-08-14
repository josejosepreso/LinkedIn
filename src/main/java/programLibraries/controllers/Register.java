package programLibraries.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import programLibraries.Configuration;
import programLibraries.Validator;
import programLibraries.WebResponse;

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
		
		WebResponse webResponse = new WebResponse();
		webResponse.setStatus(false);
		webResponse.setContent("Error. Informacion no valida.");
		
		if(
				request.getParameter("name") != null &&
				
				request.getParameter("lastName") != null &&
				
				request.getParameter("email") != null &&
				Validator.isEmail(request.getParameter("email")) &&
				
				request.getParameter("password") != null &&
				
				request.getParameter("pBirth") != null &&
				
				request.getParameter("residence") != null &&
				
				request.getParameter("phone") != null &&
				
				request.getParameter("dateB") != null &&
				
				request.getParameter("registrationDate") != null
		) {
			
			String name = request.getParameter("name");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String pBirth = request.getParameter("pBirth");
			String residence = request.getParameter("residence");
			String phone = request.getParameter("phone");
			String dateB = request.getParameter("dateB");
			String registrationDate = request.getParameter("registrationDate");
			Object profilePhoto = request.getParameter("profilePhoto");
			
			String query = "INSERT INTO TBL_USUARIOS VALUES(SQ_CODIGO_USUARIO.NEXTVAL,?,?,?,?,?,?,?,?,?,?)";
			
			try {
				
				Connection connection = DriverManager.getConnection(Configuration.DATABASE_URL,Configuration.DATABASE_USERNAME,Configuration.DATABASE_PASSWORD);
				
				// PreparedStatement ps = connection.prepareStatement(query);
				
				PreparedStatement ps = connection.prepareStatement("SELECT * FROM TBL_LUGARES WHERE NOMBRE_LUGAR = ?");
				ps.setString(1, pBirth);
				ResultSet rs = ps.executeQuery();
				int placeBirth = 0;
				if(rs.next()) {
					placeBirth = Integer.parseInt(rs.getString("CODIGO_LUGAR"));
				}
				
				ps = connection.prepareStatement("SELECT * FROM TBL_LUGARES WHERE NOMBRE_LUGAR = ?");
				ps.setString(1, residence);
				rs = ps.executeQuery();
				int placeResidence = 0;
				if(rs.next()) {
					placeResidence = Integer.parseInt(rs.getString("CODIGO_LUGAR"));
				}
				
				ps = connection.prepareStatement(query);
				
				ps.setString(1, email);
				ps.setString(2, password);
				ps.setString(3, name);
				ps.setString(4, lastName);
				ps.setInt(5, placeBirth);
				ps.setInt(6, placeResidence);
				ps.setString(7, phone);
				ps.setDate(8, java.sql.Date.valueOf(dateB));
				ps.setDate(9, java.sql.Date.valueOf(registrationDate));
				ps.setBlob(10, (Blob) null);
				
				// ResultSet rs = ps.executeQuery();
				rs = ps.executeQuery();
				
				if(rs.next()) {
					
					webResponse.setStatus(true);
					webResponse.setContent("Registro exitoso.");
				} else {
					System.out.println("error");
				}
				
			} catch(Exception e) {
				
				System.out.println(e);
				
				webResponse.setContent("Error de base de datos.");
			}
		}
		
		response.getWriter().append(webResponse.toJSON());
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
