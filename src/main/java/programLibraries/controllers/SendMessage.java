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
 * Servlet implementation class SendMessage
 */
public class SendMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMessage() {
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
		webResponse.setContent("Error enviando mensaje.");
		
		if(
				request.getParameter("sender") != null &&
				request.getParameter("receiver") != null &&
				request.getParameter("message") != "" &&
				request.getParameter("message").length() < 101
		) {
			
			String query =
					"INSERT INTO TBL_MENSAJES_PRIVADOS (CODIGO_MENSAJE,USUARIO_EMISOR,USUARIO_RECEPTOR,FECHA,CONTENIDO)\r\n"
					+ "VALUES (SQ_CODIGO_MENSAJE.NEXTVAL,?,?,SYSDATE,?)";
			
			int sender = Integer.parseInt(request.getParameter("sender"));
			int receiver = Integer.parseInt(request.getParameter("receiver"));
			String message = request.getParameter("message");
			
			try {
				
				Connection connection = DriverManager.getConnection(Configuration.DATABASE_URL,Configuration.DATABASE_USERNAME,Configuration.DATABASE_PASSWORD);
				
				PreparedStatement ps = connection.prepareStatement(query,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
				
				ps.setInt(1, sender);
				ps.setInt(2, receiver);
				ps.setString(3, message);
				
				ps.executeQuery();
				
				webResponse.setStatus(true);
				webResponse.setContent("Mensaje enviado.");
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
