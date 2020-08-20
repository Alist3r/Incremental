package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utility.Procedure;

@SuppressWarnings("serial")
public abstract class BaseServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			performTask(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			performTask(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected abstract void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException;
	
	protected void toRedirectPage(HttpServletRequest request, HttpServletResponse response, String toPage ) throws ServletException, IOException {
		
		request.getSession().setAttribute("toPage", toPage);
		String url = Procedure.creaUrltoPage("redirect");
		request.getRequestDispatcher(url).forward(request, response);
		
	}
}