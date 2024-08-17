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

/**
 * Servlet implementation class GetComments
 */
public class GetComments extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetComments() {
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
		webResponse.setContent("Error obteniendo comentarios.");
		
		String postId = request.getParameter("id");
		
		if(postId != null) {
			
			String query =
					"SELECT CODIGO_COMENTARIO,CODIGO_COMENTARIO_SUPERIOR,NOMBRE_USUARIO,CONTENIDO,FOTO_PERFIL\r\n"
					+ "FROM\r\n"
					+ "(SELECT A.CODIGO_COMENTARIO,A.CODIGO_COMENTARIO_SUPERIOR,A.CODIGO_PUBLICACION,B.NOMBRE || ' ' || B.APELLIDO AS NOMBRE_USUARIO,A.CONTENIDO,B.FOTO_PERFIL\r\n"
					+ "FROM TBL_COMENTARIOS A INNER JOIN TBL_USUARIOS B ON (A.CODIGO_USUARIO = B.CODIGO_USUARIO))\r\n"
					+ "WHERE CODIGO_PUBLICACION = ?";
			
			try {
				
				Connection connection = DriverManager.getConnection(Configuration.DATABASE_URL,Configuration.DATABASE_USERNAME,Configuration.DATABASE_PASSWORD);
				
				PreparedStatement ps = connection.prepareStatement(query,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				
				ps.setInt(1, Integer.parseInt(postId));
				
				ResultSet rs = ps.executeQuery();
				
				StringBuilder json = new StringBuilder("{");
				
				int i = 1;
				
				while(rs.next()){
					
					json.append(String.format("\"%s\"", i++));
					json.append(":");
					
					json.append("{");
					
					json.append("\"CODIGO_COMENTARIO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getInt("CODIGO_COMENTARIO")));
					json.append(",");
					
					json.append("\"CODIGO_COMENTARIO_SUPERIOR\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getInt("CODIGO_COMENTARIO_SUPERIOR")));
					json.append(",");
					
					json.append("\"NOMBRE_USUARIO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("NOMBRE_USUARIO")));
					json.append(",");
					
					json.append("\"CONTENIDO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("CONTENIDO")));
					json.append(",");
					
					json.append("\"FOTO_PERFIL\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getBlob("FOTO_PERFIL")));
					
					json.append("}");
					
					if(!rs.isLast()) json.append(",");
				}
				
				json.append("}");
				
				response.getWriter().append(String.format("{\"status\":\"true\",\"content\":%s}", json.toString()));
				
				return;
			} catch (Exception e) {
				
				System.out.println(e);
				
				webResponse.setContent("Error de base de datos.");
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
