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
import java.sql.ResultSet;
import java.sql.SQLIntegrityConstraintViolationException;

/**
 * Servlet implementation class SetReaction
 */
public class SetReaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetReaction() {
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
		webResponse.setContent("Error reaccionando.");
		
		if(request.getParameter("postId") != null && request.getParameter("reaction") != null) {
			
			int postId = Integer.parseInt(request.getParameter("postId"));
			String reaction = request.getParameter("reaction");
			
			String query;
			
			try {
				
				Connection connection = DriverManager.getConnection(Configuration.DATABASE_URL,Configuration.DATABASE_USERNAME,Configuration.DATABASE_PASSWORD);
				
				// 
				query = "DELETE FROM TBL_REACCIONES_POR_PUBLICACION WHERE CODIGO_PUBLICACION = ? AND CODIGO_USUARIO = ?";
				
				PreparedStatement ps = connection.prepareStatement(query);
				
				ps.setInt(1, postId);
				ps.setInt(2, ((User) request.getSession().getAttribute("user")).getId());
				
				ps.executeQuery();
				
				
				
				// 
				query = "SELECT CODIGO_REACCION FROM TBL_REACCIONES WHERE NOMBRE_REACCION = ?";
				
				ps = connection.prepareStatement(query);
				
				ps.setString(1, reaction.trim());
				
				ResultSet rs = ps.executeQuery();
				
				rs.next();
				
				int reactionId = rs.getInt(1);
				
				//
				query =
						"INSERT INTO TBL_REACCIONES_POR_PUBLICACION (CODIGO_PUBLICACION,CODIGO_USUARIO,CODIGO_REACCION,FECHA)\r\n"
						+ "VALUES (?,?,?,SYSDATE)";
				
				
				
				ps = connection.prepareStatement(query);
				ps.setInt(1, postId);
				ps.setInt(2, ((User) request.getSession().getAttribute("user")).getId());
				ps.setInt(3, reactionId);
				
				ps.executeQuery();
				
				webResponse.setStatus(true);
				webResponse.setContent("Reaccionado con exito.");
				
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
