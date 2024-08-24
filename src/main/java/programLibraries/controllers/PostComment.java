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

/**
 * Servlet implementation class PostComment
 */
public class PostComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostComment() {
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
		webResponse.setContent("Error publicando comentario.");
		
		if(request.getParameter("content") != "") {
			
			int post = Integer.parseInt(request.getParameter("post"));
			String comment = request.getParameter("content");
			
			String query = "INSERT INTO TBL_COMENTARIOS (CODIGO_COMENTARIO,CODIGO_PUBLICACION,CODIGO_USUARIO,CONTENIDO,CODIGO_COMENTARIO_SUPERIOR,FECHA)"
					+ "VALUES (SQ_CODIGO_COMENTARIO.NEXTVAL,?,?,?,null,SYSDATE)";
			
			try {
				
				Connection connection = DriverManager.getConnection(Configuration.DATABASE_URL,Configuration.DATABASE_USERNAME,Configuration.DATABASE_PASSWORD);
				
				PreparedStatement ps = connection.prepareStatement(query);
				
				ps.setInt(1, post);
				ps.setInt(2, ((User) request.getSession().getAttribute("user")).getId());
				ps.setString(3, comment);
				
				ps.executeQuery();
				
				webResponse.setStatus(true);
				webResponse.setContent("Comentario publicado.");
				
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
