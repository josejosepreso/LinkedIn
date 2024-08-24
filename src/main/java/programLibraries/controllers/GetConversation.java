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
 * Servlet implementation class GetConversation
 */
public class GetConversation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetConversation() {
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
		webResponse.setContent("Error obteniendo mensajes.");
		
		if(request.getParameter("id") != null) {
			
			String query =
				"SELECT  A.USUARIO_EMISOR AS CODIGO_USUARIO_EMISOR,\r\n"
				+ "        B.NOMBRE || ' ' || B.APELLIDO AS NOMBRE_USUARIO_EMISOR,\r\n"
				+ "        B.NOMBRE_FOTO_PERFIL,\r\n"
				+ "        A.USUARIO_RECEPTOR AS CODIGO_USUARIO_RECEPTOR,\r\n"
				+ "        C.NOMBRE || ' ' || C.APELLIDO AS NOMBRE_USUARIO_EMISOR,\r\n"
				+ "        C.NOMBRE_FOTO_PERFIL,\r\n"
				+ "        A.CONTENIDO,\r\n"
				+ "		   A.FECHA\r\n"
				+ "FROM TBL_MENSAJES_PRIVADOS A\r\n"
				+ "INNER JOIN TBL_USUARIOS B\r\n"
				+ "ON (A.USUARIO_EMISOR = B.CODIGO_USUARIO)\r\n"
				+ "INNER JOIN TBL_USUARIOS C\r\n"
				+ "ON (A.USUARIO_RECEPTOR = C.CODIGO_USUARIO)\r\n"
				+ "WHERE A.USUARIO_EMISOR IN (?,?)\r\n"
				+ "AND A.USUARIO_RECEPTOR IN (?,?)\r\n"
				+ "ORDER BY A.FECHA";
			
			try {
				
				Connection connection = DriverManager.getConnection(Configuration.DATABASE_URL,Configuration.DATABASE_USERNAME,Configuration.DATABASE_PASSWORD);
				
				PreparedStatement ps = connection.prepareStatement(query,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				
				HttpSession session = request.getSession();
				int user1 = (int) ((User) session.getAttribute("user")).getId();
				int user2 = Integer.parseInt(request.getParameter("id"));
				
				ps.setInt(1, user1);
				ps.setInt(2, user2);
				ps.setInt(3, user1);
				ps.setInt(4, user2);
				
				ResultSet rs = ps.executeQuery();
				
				StringBuilder json = new StringBuilder("{");
				
				int i = 1;
				
				while(rs.next()){
					
					json.append(String.format("\"%s\"", i++));
					json.append(":");
					
					json.append("{");
					
					json.append("\"CODIGO_USUARIO_EMISOR\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getInt(1)));
					json.append(",");
					
					json.append("\"NOMBRE_USUARIO_EMISOR\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString(2)));
					json.append(",");
					
					json.append("\"CODIGO_USUARIO_RECEPTOR\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getInt(4)));
					json.append(",");
					
					json.append("\"NOMBRE_USUARIO_RECEPTOR\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString(5)));
					json.append(",");
					
					json.append("\"MENSAJE\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString(7)));
					json.append(",");
					
					json.append("\"FECHA\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getDate(8)));
					
					json.append("}");
					
					if(!rs.isLast()) json.append(",");
				}
				
				json.append("}");
				
				json.append(",");
				
				query = "SELECT CODIGO_USUARIO,NOMBRE || ' ' || APELLIDO AS NOMBRE_USUARIO,NOMBRE_FOTO_PERFIL FROM TBL_USUARIOS WHERE CODIGO_USUARIO = ?";
				ps = connection.prepareStatement(query);
				ps.setInt(1, user2);
				rs = ps.executeQuery();
				
				if(rs.next()) {
					
					json.append("\"CODIGO_USUARIO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString(1)));
					json.append(",");
					
					json.append("\"NOMBRE_USUARIO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString(2)));
					json.append(",");
					
					json.append("\"FOTO_PERFIL\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString(3)));
				}
				
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
