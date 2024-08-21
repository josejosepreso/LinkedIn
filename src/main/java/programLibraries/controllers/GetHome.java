package programLibraries.controllers;

import jakarta.servlet.ServletException;
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
 * Servlet implementation class GetHome
 */
public class GetHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetHome() {
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
		webResponse.setContent("Error obteniendo publicaciones.");
		
		Object user = request.getSession().getAttribute("user");
		
		if(user != null) {
			
			// Obtener publicaciones en base a usuarios seguidos
			String query =
					"WITH SIGUIENDO AS (SELECT CODIGO_USUARIO_SIGUIENDO FROM TBL_SEGUIDORES WHERE CODIGO_USUARIO_SEGUIDOR=? UNION SELECT ? FROM DUAL),\r\n"
					+ "REACCIONES AS (SELECT  A.CODIGO_PUBLICACION,COUNT(B.CODIGO_REACCION) AS CANTIDAD_REACCIONES FROM TBL_PUBLICACIONES A,TBL_REACCIONES_POR_PUBLICACION B WHERE A.CODIGO_PUBLICACION = B.CODIGO_PUBLICACION (+) GROUP BY A.CODIGO_PUBLICACION),\r\n"
					+ "COMENTARIOS AS (SELECT  A.CODIGO_PUBLICACION,COUNT(B.CODIGO_COMENTARIO) AS CANTIDAD_COMENTARIOS FROM TBL_PUBLICACIONES A,TBL_COMENTARIOS B WHERE A.CODIGO_PUBLICACION = B.CODIGO_PUBLICACION (+) GROUP BY A.CODIGO_PUBLICACION)\r\n"
					+ "SELECT DISTINCT A.CODIGO_PUBLICACION,G.NOMBRE_REACCION,B.CODIGO_USUARIO_SIGUIENDO,C.NOMBRE || ' ' || C.APELLIDO AS USUARIO,A.CONTENIDO,A.FECHA_PUBLICACION,D.CANTIDAD_REACCIONES,E.CANTIDAD_COMENTARIOS,C.NOMBRE_FOTO_PERFIL\r\n"
					+ "FROM TBL_PUBLICACIONES A,SIGUIENDO B,TBL_USUARIOS C,REACCIONES D,COMENTARIOS E,TBL_REACCIONES_POR_PUBLICACION F,TBL_REACCIONES G\r\n"
					+ "WHERE A.CODIGO_USUARIO = B.CODIGO_USUARIO_SIGUIENDO\r\n"
					+ "AND C.CODIGO_USUARIO = A.CODIGO_USUARIO\r\n"
					+ "AND D.CODIGO_PUBLICACION = A.CODIGO_PUBLICACION\r\n"
					+ "AND E.CODIGO_PUBLICACION = A.CODIGO_PUBLICACION\r\n"
					+ "AND A.CODIGO_PUBLICACION = F.CODIGO_PUBLICACION (+)\r\n"
					+ "AND F.CODIGO_REACCION = G.CODIGO_REACCION (+)\r\n"
					+ "ORDER BY FECHA_PUBLICACION DESC";

			// Obtener puesto laboral actual en pagina de inicio
			String query1 =
					"SELECT  A.PUESTO || ' en ' || B.NOMBRE AS PUESTO_ACTUAL\r\n"
					+ "FROM TBL_EXPERIENCIAS_LABORALES A,TBL_EMPRESAS B\r\n"
					+ "WHERE A.FECHA_FIN IS NULL\r\n"
					+ "AND B.CODIGO_EMPRESA = A.CODIGO_EMPRESA\r\n"
					+ "AND CODIGO_USUARIO = ?";
			
			// Obtener usuarios no seguidos
			String query2 =
					"WITH NO_SIGUIENDO AS (\r\n"
					+ "    SELECT CODIGO_USUARIO\r\n"
					+ "    FROM (\r\n"
					+ "        SELECT CODIGO_USUARIO_SIGUIENDO\r\n"
					+ "        FROM TBL_SEGUIDORES\r\n"
					+ "        WHERE CODIGO_USUARIO_SEGUIDOR = ?\r\n"
					+ "    ) A\r\n"
					+ "    RIGHT JOIN TBL_USUARIOS B\r\n"
					+ "    ON (A.CODIGO_USUARIO_SIGUIENDO = B.CODIGO_USUARIO)\r\n"
					+ "    WHERE A.CODIGO_USUARIO_SIGUIENDO IS NULL\r\n"
					+ "    AND CODIGO_USUARIO <> ?\r\n"
					+ ")\r\n"
					+ "SELECT  A.CODIGO_USUARIO,\r\n"
					+ "		   A.NOMBRE || ' ' || A.APELLIDO AS NOMBRE_USUARIO,\r\n"
					+ "        A.DESCRIPCION,\r\n"
					+ "        A.NOMBRE_FOTO_PERFIL\r\n"
					+ "FROM TBL_USUARIOS A\r\n"
					+ "INNER JOIN NO_SIGUIENDO B\r\n"
					+ "ON (A.CODIGO_USUARIO = B.CODIGO_USUARIO)";
			
			try {
				
				Connection connection = DriverManager.getConnection(Configuration.DATABASE_URL,Configuration.DATABASE_USERNAME,Configuration.DATABASE_PASSWORD);
				
				PreparedStatement ps = connection.prepareStatement(query,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				
				ps.setInt(1, (int) ((User) user).getId());
				ps.setInt(2, (int) ((User) user).getId());
				
				ResultSet rs = ps.executeQuery();
				
				StringBuilder json = new StringBuilder("{");
				
				json.append("\"posts\"");
				json.append(":");
				json.append("{");
				
				int i = 1;
				
				while(rs.next()){
					
					json.append(String.format("\"%s\"", i++));
					json.append(":");
					
					json.append("{");
					
					json.append("\"CODIGO_PUBLICACION\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getInt("CODIGO_PUBLICACION")));
					json.append(",");
					
					json.append("\"REACCION\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("NOMBRE_REACCION")));
					json.append(",");
					
					json.append("\"CODIGO_USUARIO_SIGUIENDO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getInt("CODIGO_USUARIO_SIGUIENDO")));
					json.append(",");
					
					json.append("\"USUARIO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("USUARIO")));
					json.append(",");
					
					json.append("\"CONTENIDO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("CONTENIDO")));
					json.append(",");
					
					json.append("\"FECHA_PUBLICACION\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getDate("FECHA_PUBLICACION")));
					json.append(",");
					
					json.append("\"CANTIDAD_REACCIONES\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getInt("CANTIDAD_REACCIONES")));
					json.append(",");
					
					json.append("\"CANTIDAD_COMENTARIOS\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getInt("CANTIDAD_COMENTARIOS")));
					json.append(",");
					
					json.append("\"NOMBRE_FOTO_PERFIL\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("NOMBRE_FOTO_PERFIL")));
					
					json.append("}");
					
					// if(!rs.isLast()) json.append(",");
					if(!rs.isLast()) json.append(",");
				}
				
				json.append("}}");
				
				// PUESTO ACTUAL
				ps = connection.prepareStatement(query1);
				ps.setInt(1, (int) ((User) user).getId());
				rs = ps.executeQuery();
				
				json.append(",");
				
				json.append("\"PUESTO_ACTUAL\"");
				json.append(":");
				
				if(rs.next()) {
					
					json.append(String.format("\"%s\"", rs.getString("PUESTO_ACTUAL")));
				} else {
					
					json.append("null");
				}
				
				json.append(",");
				
				// USUARIOS NO SEGUIDOS
				ps = connection.prepareStatement(query2,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				ps.setInt(1, (int) ((User) user).getId());
				ps.setInt(2, (int) ((User) user).getId());
				rs = ps.executeQuery();
				
				json.append("\"USUARIOS_NO_SEGUIDOS\"");
				json.append(":");
				json.append("{");
				
				i = 1;
				
				while(rs.next()){
					
					json.append(String.format("\"%s\"", i++));
					json.append(":");
					json.append("{");
					
					json.append("\"CODIGO_USUARIO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("CODIGO_USUARIO")));
					json.append(",");
					
					json.append("\"NOMBRE_USUARIO\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("NOMBRE_USUARIO")));
					json.append(",");
					
					json.append("\"DESCRIPCION\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("DESCRIPCION")));
					json.append(",");
					
					json.append("\"NOMBRE_FOTO_PERFIL\"");
					json.append(":");
					json.append(String.format("\"%s\"", rs.getString("NOMBRE_FOTO_PERFIL")));
					
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
