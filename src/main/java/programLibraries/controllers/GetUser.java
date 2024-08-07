package programLibraries.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import programLibraries.User;
import programLibraries.WebResponse;

import java.io.IOException;

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
		
		if(request.getParameter("id") == null) {
			
			WebResponse webResponse = new WebResponse();
			webResponse.setStatus(false);
			webResponse.setContent("Error. Usuario no especificado");
			
			response.getWriter().append(webResponse.toJSON());
			
			return;
		}
		
		String username = "Cradily";
		String img = "profile.png";
		int id = 0;
		
		User user = new User(id, username, img);
		
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
		
		user.setId(id);
		user.setUsername(username);
		user.setImg(img);
		
		response.getWriter().append(String.format("{\"status\":\"true\",\"content\":%s}", user.toJSON()));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
