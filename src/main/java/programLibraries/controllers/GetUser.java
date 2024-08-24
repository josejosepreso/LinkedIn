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
			
			// Obtener informacion personal
			String query =
				"WITH PUESTO_ACTUAL AS (SELECT  A.CODIGO_USUARIO,A.PUESTO || ' en '  || B.NOMBRE AS PUESTO_ACTUAL\r\n"
				+ "FROM TBL_EXPERIENCIAS_LABORALES A,TBL_EMPRESAS B\r\n"
				+ "WHERE A.CODIGO_EMPRESA = B.CODIGO_EMPRESA AND FECHA_FIN IS NULL)\r\n"
				+ "SELECT A.NOMBRE || ' ' || A.APELLIDO AS NOMBRE_COMPLETO,A.NOMBRE_FOTO_PERFIL,B.PUESTO_ACTUAL,A.CORREO,C.NOMBRE_LUGAR || ', ' || D.NOMBRE_LUGAR AS LUGAR_RESIDENCIA,A.DESCRIPCION,A.TELEFONO\r\n"
				+ "FROM TBL_USUARIOS A,PUESTO_ACTUAL B,TBL_LUGARES C,TBL_LUGARES D\r\n"
				+ "WHERE A.CODIGO_USUARIO = B.CODIGO_USUARIO (+)\r\n"
				+ "AND C.CODIGO_LUGAR = A.LUGAR_RESIDENCIA\r\n"
				+ "AND C.CODIGO_LUGAR_SUPERIOR = D.CODIGO_LUGAR\r\n"
				+ "AND A.CODIGO_USUARIO = ?";
			
			// Obtener experiencias laborales
			String query1 =
					"SELECT A.PUESTO,B.NOMBRE AS EMPRESA,A.FECHA_INICIO || ' - ' || NVL(TO_CHAR(A.FECHA_FIN),'Ahora') AS TIEMPO\r\n"
					+ "FROM TBL_EXPERIENCIAS_LABORALES A,TBL_EMPRESAS B\r\n"
					+ "WHERE A.CODIGO_EMPRESA = B.CODIGO_EMPRESA\r\n"
					+ "AND A.CODIGO_USUARIO = ?";
			
			// Obtener informacion de educacion
			String query2 =
					"SELECT A.TITULO,B.NOMBRE AS INSTITUCION,A.FECHA_INICIO || ' - ' || NVL(TO_CHAR(A.FECHA_FIN),'Ahora') AS TIEMPO\r\n"
					+ "FROM TBL_TITULOS_ACADEMICOS A,TBL_INSTITUCIONES B\r\n"
					+ "WHERE B.CODIGO_INSTITUCION = A.CODIGO_INSTITUCION\r\n"
					+ "AND CODIGO_USUARIO = ?";
			
			// Obtener logros
			String query3 =
					"SELECT A.TITULO || ' (' || B.NOMBRE || ')' AS TITULO,C.NOMBRE AS INSTITUCION,A.FECHA_OBTENCION\r\n"
					+ "FROM TBL_LOGROS A,TBL_TIPOS_LOGROS B,TBL_INSTITUCIONES C\r\n"
					+ "WHERE A.CODIGO_TIPO_LOGRO = B.CODIGO_TIPO_LOGRO\r\n"
					+ "AND C.CODIGO_INSTITUCION = A.REMITIDO_POR\r\n"
					+ "AND A.CODIGO_USUARIO = ?";
			
			// Obtener habiliades y aprobaciones
			String query4 =
					"WITH APROBACIONES AS (\r\n"
					+ "SELECT  CODIGO_USUARIO,CODIGO_HABILIDAD,COUNT(*) AS NUMERO_APROBACIONES\r\n"
					+ "FROM TBL_APROBACIONES_HABILIDADES\r\n"
					+ "GROUP BY CODIGO_USUARIO,CODIGO_HABILIDAD\r\n"
					+ ")\r\n"
					+ "SELECT C.NOMBRE AS HABILIDAD,NVL(B.NUMERO_APROBACIONES,0) AS APROBACIONES\r\n"
					+ "FROM TBL_HABILIDADES_POR_USUARIOS A,APROBACIONES B,TBL_HABILIDADES C\r\n"
					+ "WHERE A.CODIGO_HABILIDAD = B.CODIGO_HABILIDAD (+)\r\n"
					+ "AND A.CODIGO_USUARIO = B.CODIGO_USUARIO (+)\r\n"
					+ "AND C.CODIGO_HABILIDAD = A.CODIGO_HABILIDAD\r\n"
					+ "AND A.CODIGO_USUARIO = ?";
			
			// 
			String query5 = "SELECT 1 FROM TBL_SEGUIDORES WHERE CODIGO_USUARIO_SEGUIDOR = ? AND CODIGO_USUARIO_SIGUIENDO = ?";
			
			int id = Integer.parseInt(request.getParameter("id"));
			
			try {
				
				Connection connection = DriverManager.getConnection(Configuration.DATABASE_URL,Configuration.DATABASE_USERNAME,Configuration.DATABASE_PASSWORD);
				
				// INFORMACION PERSONAL
				PreparedStatement ps = connection.prepareStatement(query,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				
				ps.setInt(1, id);
				
				ResultSet rs = ps.executeQuery();
				
				StringBuilder json = new StringBuilder("{");
				
				json.append("\"INFORMACION_PERSONAL\"");
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
					json.append(",");
					
					json.append("\"TELEFONO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("TELEFONO")));
				}
				
				json.append("}");
				
				json.append(",");
				
				// EXPERIENCIA
				ps = connection.prepareStatement(query1,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				ps.setInt(1, id);
				rs = ps.executeQuery();
				
				json.append("\"EXPERIENCIA\"");
				json.append(":");
				json.append("{");
				
				int i = 1;
				while(rs.next()) {
					
					json.append(String.format("\"%s\"", i++));
					json.append(":");
					
					json.append("{");
					
					json.append("\"PUESTO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("PUESTO")));
					json.append(",");
					
					json.append("\"EMPRESA\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("EMPRESA")));
					json.append(",");
					
					json.append("\"TIEMPO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("TIEMPO")));

					json.append("}");
					
					if(!rs.isLast()) json.append(",");
				}
				
				json.append("}");
				
				json.append(",");
				
				// EDUCACION
				ps = connection.prepareStatement(query2,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				ps.setInt(1, id);
				rs = ps.executeQuery();
				
				json.append("\"EDUCACION\"");
				json.append(":");
				json.append("{");
				
				i = 1;
				
				while(rs.next()) {
					
					json.append(String.format("\"%s\"", i++));
					json.append(":");
					
					json.append("{");
					
					json.append("\"TITULO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("TITULO")));
					json.append(",");
					
					json.append("\"INSTITUCION\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("INSTITUCION")));
					json.append(",");
					
					json.append("\"TIEMPO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("TIEMPO")));

					json.append("}");
					
					if(!rs.isLast()) json.append(",");
				}
				
				json.append("}");
				
				json.append(",");
				
				// LOGROS
				ps = connection.prepareStatement(query3,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				ps.setInt(1, id);
				rs = ps.executeQuery();
				
				json.append("\"LOGROS\"");
				json.append(":");
				json.append("{");
				
				i = 1;
				
				while(rs.next()) {
					
					json.append(String.format("\"%s\"", i++));
					json.append(":");
					
					json.append("{");
					
					json.append("\"TITULO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("TITULO")));
					json.append(",");
					
					json.append("\"INSTITUCION\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("INSTITUCION")));
					json.append(",");
					
					json.append("\"FECHA_OBTENCION\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("FECHA_OBTENCION")));

					json.append("}");
					
					if(!rs.isLast()) json.append(",");
				}
				
				json.append("}");
				
				json.append(",");
				
				// HABILIDADES
				ps = connection.prepareStatement(query4,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				ps.setInt(1, id);
				rs = ps.executeQuery();
				
				json.append("\"HABILIDADES\"");
				json.append(":");
				json.append("{");
				
				while(rs.next()) {
					
					json.append(String.format("\"%s\"", rs.getString("HABILIDAD")));
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("APROBACIONES")));
					
					if(!rs.isLast()) json.append(",");
				}
				
				json.append("}");
				json.append(",");
				
				// 
				ps = connection.prepareStatement(query5,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				ps.setInt(1, ((User) request.getSession().getAttribute("user")).getId());
				ps.setInt(2, id);
				rs = ps.executeQuery();
				
				json.append("\"SIGUIENDO\"");
				json.append(":");
				
				if(rs.next()) json.append("1");
				else json.append("0");
				
				json.append("}");
				
				response.getWriter().append(String.format("{\"status\":\"true\",\"content\":%s}", json.toString()));
				
				return;
			} catch(Exception e) {
				
				System.out.println(e);
			}
		}
		
		response.getWriter().append(webResponse.toJSON());
		
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