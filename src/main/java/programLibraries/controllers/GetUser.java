package programLibraries.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import programLibraries.Configuration;
import programLibraries.User;
import programLibraries.Validator;
import programLibraries.WebResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class GetUser
 */
public class GetUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUser() {
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
		webResponse.setContent("Error. Usuario no especificado");
		
		if(request.getParameter("id") != null && Validator.isNumber(request.getParameter("id"))) {
			
			String query =
				"WITH PUESTO_ACTUAL AS (SELECT  A.CODIGO_USUARIO,A.PUESTO || ' en '  || B.NOMBRE AS PUESTO_ACTUAL\r\n"
				+ "FROM TBL_EXPERIENCIAS_LABORALES A,TBL_EMPRESAS B\r\n"
				+ "WHERE A.CODIGO_EMPRESA = B.CODIGO_EMPRESA AND FECHA_FIN IS NULL)\r\n"
				+ "SELECT A.NOMBRE || ' ' || A.APELLIDO AS NOMBRE_COMPLETO,A.NOMBRE_FOTO_PERFIL,B.PUESTO_ACTUAL,A.CORREO,C.NOMBRE_LUGAR || ', ' || D.NOMBRE_LUGAR AS LUGAR_RESIDENCIA,A.DESCRIPCION\r\n"
				+ "FROM TBL_USUARIOS A,PUESTO_ACTUAL B,TBL_LUGARES C,TBL_LUGARES D\r\n"
				+ "WHERE A.CODIGO_USUARIO = B.CODIGO_USUARIO (+)\r\n"
				+ "AND C.CODIGO_LUGAR = A.LUGAR_RESIDENCIA\r\n"
				+ "AND C.CODIGO_LUGAR_SUPERIOR = D.CODIGO_LUGAR\r\n"
				+ "AND A.CODIGO_USUARIO = ?";
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			try {
				
				Connection connection = DriverManager.getConnection(Configuration.DATABASE_URL,Configuration.DATABASE_USERNAME,Configuration.DATABASE_PASSWORD);
				
				PreparedStatement ps = connection.prepareStatement(query,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				
				ps.setInt(1, id);
				
				ResultSet rs = ps.executeQuery();
				
				StringBuilder json = new StringBuilder("{");
				
				json.append("\"userInfo\"");
				json.append(":");
				json.append("{");
				
				if(rs.next()) {
					
					json.append("\"NOMBRE_COMPLETO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("NOMBRE_COMPLETO")));
					json.append(",");
					
					json.append("\"NOMBRE_FOTO_PERFIL\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("NOMBRE_FOTO_PERFIL")));
					json.append(",");
					
					json.append("\"CORREO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("CORREO")));
					json.append(",");
					
					json.append("\"LUGAR_RESIDENCIA\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("LUGAR_RESIDENCIA")));
					json.append(",");
					
					json.append("\"PUESTO_ACTUAL\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("PUESTO_ACTUAL")));
					json.append(",");
					
					json.append("\"DESCRIPCION\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("DESCRIPCION")));
				}
				
				json.append("}}");
				
				response.getWriter().append(String.format("{\"status\":\"true\",\"content\":%s}", json.toString()));
				
				return;
			} catch(Exception e) {
				
				System.out.println(e);
			}
		}
		

		
		String username = "Cradily";
		String img = "profile.png";
		int id = 0;
		
		// User user = new User(id, username, img);
		
		id = Integer.parseInt(request.getParameter("id"));
		
		if(id == 1) {
			username = "Swampert";
			img = "swampert.png";
		} else
		
		if(id == 2) {
			
			username = "Haunter";
			img = "haunter.png";
		} else
			
		if(id == 3) {
			
			username = "Dewgon";
			img = "dewgon.png";
		} else
			
		if(id == 4) {
			
			username = "Beedrill";
			img = "beedrill.png";
		}
		
		// response.getWriter().append(String.format("{\"status\":\"true\",\"content\":%s}", user.toJSON()));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
