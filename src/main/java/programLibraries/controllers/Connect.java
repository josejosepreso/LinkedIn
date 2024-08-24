package programLibraries.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import programLibraries.Configuration;
import programLibraries.User;
import programLibraries.WebResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 * Servlet implementation class Connect
 */
public class Connect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Connect() {
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
		webResponse.setContent("Error conectando con usuario.");
		
		if(request.getParameter("id") != null) {
			
			int userId = Integer.parseInt(request.getParameter("id"));
			
			String query = "INSERT INTO TBL_SEGUIDORES (CODIGO_USUARIO_SEGUIDOR,CODIGO_USUARIO_SIGUIENDO,FECHA) VALUES (?,?,SYSDATE)";
			
			try {
				
				Connection connection = DriverManager.getConnection(Configuration.DATABASE_URL,Configuration.DATABASE_USERNAME,Configuration.DATABASE_PASSWORD);
				
				PreparedStatement ps = connection.prepareStatement(query);
				
				ps.setInt(1, ((User) request.getSession().getAttribute("user")).getId());
				ps.setInt(2, userId);
				
				ps.executeQuery();
				
				webResponse.setStatus(true);
				webResponse.setContent("Usuario seguido con exito.");
			} catch(Exception e) {
				
				System.out.println(e);
			}
		}
		
		response.getWriter().append(webResponse.toJSON());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
