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
 * Servlet implementation class AddAchievement
 */
public class AddAchievement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAchievement() {
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
		webResponse.setContent("Error anadiendo logro.");
		
		if(
				request.getParameter("title") != "" &&
				Integer.parseInt(request.getParameter("school")) != 0 &&
				Integer.parseInt(request.getParameter("type")) != 0 &&
				request.getParameter("date") != null
		) {
			
			String title = request.getParameter("title").trim();
			int school = Integer.parseInt(request.getParameter("school"));
			int type = Integer.parseInt(request.getParameter("type"));
			String date = request.getParameter("date");
			
			String query = "INSERT INTO TBL_LOGROS (CODIGO_LOGRO,CODIGO_USUARIO,CODIGO_TIPO_LOGRO,TITULO,FECHA_OBTENCION,REMITIDO_POR) VALUES (SQ_CODIGO_LOGRO.NEXTVAL,?,?,?,?,?)";
			
			try {
				
				Connection connection = DriverManager.getConnection(Configuration.DATABASE_URL,Configuration.DATABASE_USERNAME,Configuration.DATABASE_PASSWORD);
				
				PreparedStatement ps = connection.prepareStatement(query);
				
				ps.setInt(1, ((User) request.getSession().getAttribute("user")).getId());
				ps.setInt(2, type);
				ps.setString(3, title);
				ps.setDate(4, java.sql.Date.valueOf(date));
				ps.setInt(5, school);
				
				ps.executeQuery();
				
				webResponse.setStatus(true);
				webResponse.setContent("Logro agregado.");
				
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
