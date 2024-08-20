package programLibraries.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import programLibraries.Configuration;
import programLibraries.WebResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class GetJobs
 */
public class GetJobs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetJobs() {
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
		webResponse.setContent("Error obteniendo ofertas laborales.");
		
		String query =
				"SELECT  A.TITULO,\r\n"
				+ "        B.NOMBRE AS EMPRESA,\r\n"
				+ "        C.NOMBRE_MODALIDAD AS MODALIDAD,\r\n"
				+ "        D.NOMBRE_LUGAR || ', ' || E.NOMBRE_LUGAR || ' · ' || A.FECHA_PUBLICACION || ' · ' || F.APLICACIONES AS INFORMACION,\r\n"
				+ "        A.DESCRIPCION,\r\n"
				+ "        A.FOTO\r\n"
				+ "FROM    TBL_OFERTAS_LABORALES A,\r\n"
				+ "        TBL_EMPRESAS B,\r\n"
				+ "        TBL_MODALIDADES C,\r\n"
				+ "        TBL_LUGARES D,\r\n"
				+ "        TBL_LUGARES E,\r\n"
				+ "        (\r\n"
				+ "            SELECT CODIGO_OFERTA_LABORAL, COUNT(*) AS APLICACIONES\r\n"
				+ "            FROM TBL_APLICACIONES_A_OFERTAS\r\n"
				+ "            GROUP BY CODIGO_OFERTA_LABORAL\r\n"
				+ "        ) F\r\n"
				+ "WHERE A.CODIGO_EMPRESA = B.CODIGO_EMPRESA\r\n"
				+ "AND A.MODALIDAD = C.CODIGO_MODALIDAD\r\n"
				+ "AND D.CODIGO_LUGAR = A.UBICACION\r\n"
				+ "AND D.CODIGO_LUGAR_SUPERIOR = E.CODIGO_LUGAR\r\n"
				+ "AND A.CODIGO_OFERTA_LABORAL = F.CODIGO_OFERTA_LABORAL";
		
		try {
			Connection connection = DriverManager.getConnection(Configuration.DATABASE_URL,Configuration.DATABASE_USERNAME,Configuration.DATABASE_PASSWORD);
			
			PreparedStatement ps = connection.prepareStatement(query,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
			
			ResultSet rs = ps.executeQuery();
			
			StringBuilder json = new StringBuilder("{");
			
			int i = 1;
			while(rs.next()) {
				
				json.append(String.format("\"%s\"", i++));
				json.append(":");
				json.append("{");
				
				json.append("\"TITULO\"");
				json.append(":");
				json.append(String.format("\"%s\"", rs.getString("TITULO")));
				json.append(",");
				
				json.append("\"EMPRESA\"");
				json.append(":");
				json.append(String.format("\"%s\"", rs.getString("EMPRESA")));
				json.append(",");
				
				json.append("\"MODALIDAD\"");
				json.append(":");
				json.append(String.format("\"%s\"", rs.getString("MODALIDAD")));
				json.append(",");
				
				json.append("\"INFORMACION\"");
				json.append(":");
				json.append(String.format("\"%s\"", rs.getString("INFORMACION")));
				json.append(",");
				
				json.append("\"DESCRIPCION\"");
				json.append(":");
				json.append(String.format("\"%s\"", rs.getString("DESCRIPCION")));
				json.append(",");
				
				json.append("\"FOTO\"");
				json.append(":");
				json.append(String.format("\"%s\"", rs.getString("FOTO")));
				
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
