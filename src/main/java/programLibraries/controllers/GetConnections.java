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
 * Servlet implementation class GetConnections
 */
public class GetConnections extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetConnections() {
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
		
		String query =
				"SELECT  A.CODIGO_USUARIO1,\r\n"
				+ "        B.NOMBRE || ' ' || B.APELLIDO AS NOMBRE_USUARIO1,\r\n"
				+ "        B.NOMBRE_FOTO_PERFIL,\r\n"
				+ "        A.CODIGO_USUARIO2,\r\n"
				+ "        C.NOMBRE || ' ' || C.APELLIDO AS NOMBRE_USUARIO2,\r\n"
				+ "        C.NOMBRE_FOTO_PERFIL,\r\n"
				+ "        A.FECHA\r\n"
				+ "FROM TBL_CONEXIONES A\r\n"
				+ "INNER JOIN TBL_USUARIOS B\r\n"
				+ "ON (A.CODIGO_USUARIO1 = B.CODIGO_USUARIO)\r\n"
				+ "INNER JOIN TBL_USUARIOS C\r\n"
				+ "ON (A.CODIGO_USUARIO2 = C.CODIGO_USUARIO)\r\n"
				+ "WHERE A.CODIGO_USUARIO1 = ? OR A.CODIGO_USUARIO2 = ?\r\n"
				+ "AND A.SOLICITUD_ACEPTADA = 1";
		
		try {
			
			Connection connection = DriverManager.getConnection(Configuration.DATABASE_URL,Configuration.DATABASE_USERNAME,Configuration.DATABASE_PASSWORD);
			
			PreparedStatement ps = connection.prepareStatement(query,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			
			HttpSession session = request.getSession();
			int userId = (int) ((User) session.getAttribute("user")).getId();
			
			ps.setInt(1, userId);
			ps.setInt(2, userId);
			
			ResultSet rs = ps.executeQuery();
			
			StringBuilder json = new StringBuilder("{");
			
			int i = 1;
			
			while(rs.next()){
				
				json.append(String.format("\"%s\"", i++));
				json.append(":");
				
				json.append("{");
				
				if(rs.getInt("CODIGO_USUARIO1") == userId) {
					
					json.append("\"CODIGO_USUARIO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getInt(4)));
					json.append(",");
					
					json.append("\"NOMBRE_USUARIO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString(5)));
					json.append(",");
					
					json.append("\"FOTO_PERFIL\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString(6)));
				} else {
					
					json.append("\"CODIGO_USUARIO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getInt(1)));
					json.append(",");
					
					json.append("\"NOMBRE_USUARIO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString(2)));
					json.append(",");
					
					json.append("\"FOTO_PERFIL\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString(3)));
				}
				
				json.append("}");
				
				if(!rs.isLast()) json.append(",");
			}
			
			json.append("}");
			
			response.getWriter().append(String.format("{\"status\":\"true\",\"content\":%s}", json.toString()));
			
			return;
		} catch(Exception e) {
			System.out.println(e);
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
