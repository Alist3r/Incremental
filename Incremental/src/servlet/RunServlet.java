package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utility.Procedure;

@SuppressWarnings("serial")
public class RunServlet extends BaseServlet {

	@Override
	protected void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = Procedure.creaUrltoPage("redirect");
		request.getRequestDispatcher(url).forward(request, response);
		
	
	
	}
}