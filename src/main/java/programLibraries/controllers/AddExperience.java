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
 * Servlet implementation class AddExperience
 */
public class AddExperience extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddExperience() {
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
				request.getParameter("jobPosition") != "" &&
				Integer.parseInt(request.getParameter("company")) != 0 &&
				request.getParameter("startDate") != null &&
				request.getParameter("endDate") != null
		) {
			
			String jobPosition = request.getParameter("jobPosition").trim();
			int company = Integer.parseInt(request.getParameter("company"));
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			
			String query = "INSERT INTO TBL_EXPERIENCIAS_LABORALES (CODIGO_EXPERIENCIA,CODIGO_USUARIO,CODIGO_EMPRESA,PUESTO,FECHA_INICIO,FECHA_FIN) VALUES (SQ_CODIGO_EXPERIENCIA_LABORAL.NEXTVAL,?,?,?,?,?)";
		
			try {
				
				Connection connection = DriverManager.getConnection(Configuration.DATABASE_URL,Configuration.DATABASE_USERNAME,Configuration.DATABASE_PASSWORD);
				
				PreparedStatement ps = connection.prepareStatement(query);
				
				ps.setInt(1, ((User) request.getSession().getAttribute("user")).getId());
				ps.setInt(2, company);
				ps.setString(3, jobPosition);
				ps.setDate(4, java.sql.Date.valueOf(startDate));
				ps.setDate(5, java.sql.Date.valueOf(endDate));
				
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
