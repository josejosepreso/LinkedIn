package programLibraries.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import programLibraries.Configuration;
import programLibraries.User;
import programLibraries.WebResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class CreatePost
 */
public class CreatePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreatePost() {
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
		webResponse.setContent("Error creando publicacion.");
		
		if(request.getParameter("content") != "" && request.getParameter("date") != null) {
			
			String query = "INSERT INTO TBL_PUBLICACIONES (CODIGO_PUBLICACION,CODIGO_USUARIO,CONTENIDO,FECHA_PUBLICACION,FOTO) VALUES (SQ_CODIGO_PUBLICACION.NEXTVAL,?,?,?,?)";
			
			try {
				Connection connection = DriverManager.getConnection(Configuration.DATABASE_URL,Configuration.DATABASE_USERNAME,Configuration.DATABASE_PASSWORD);
				
				PreparedStatement ps = connection.prepareStatement(query,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				
				HttpSession session = request.getSession();
				User user = (User) session.getAttribute("user");
				
				ps.setInt(1, (int) ((User) user).getId());
				ps.setString(2, request.getParameter("content"));
				ps.setDate(3, java.sql.Date.valueOf(request.getParameter("date")));
				ps.setString(4, null);
				
				ResultSet rs = ps.executeQuery();
				
				ps = connection.prepareStatement("SELECT MAX(CODIGO_PUBLICACION) AS CODIGO_PUBLICACION FROM TBL_PUBLICACIONES");
				rs = ps.executeQuery();
				
				StringBuilder json = new StringBuilder("{");
				
				if(rs.next()) {
					
					json.append("\"CODIGO_PUBLICACION\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getInt("CODIGO_PUBLICACION")));
				}
				
				json.append("}");
				
				response.getWriter().append(String.format("{\"status\":\"true\",\"content\":%s}", json.toString()));
				return;
			} catch(Exception e) {
				
				System.out.println(e);
			}
		}
		
		response.getWriter().append(webResponse.toJSON());
		// TODO Auto-generated method stub
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
