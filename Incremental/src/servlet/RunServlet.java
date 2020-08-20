package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CapitoloDao;
import oggetti.Utente;
import utility.Costanti;

@SuppressWarnings("serial")
public class RunServlet extends BaseServlet {

	@Override
	protected void performTask(HttpServletRequest request, HttpServletResponse response)  {

		String capitolo = request.getParameter(Costanti.ATTR_CAPITOLO);
		Utente utente = (Utente) request.getSession().getAttribute(Costanti.ATTR_UTENTE);
		int idUtente = utente.getIdUtente();
		
		CapitoloDao capDao;
		try {
			capDao = new CapitoloDao();
			capDao.setUltimoCapitolo(idUtente, capitolo);
			//HashMap<String, Object> parametriSession = (HashMap<String, Object>) request.getSession().getAttribute(Costanti.ATTR_PARAM_LIST);
			//parametriSession.replace(Costanti.ATTR_CAPITOLO, String.valueOf(capitolo)); 
			request.getSession().setAttribute(Costanti.ATTR_CAPITOLO, "capitolo-" + capitolo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			toRedirectPage(request, response, "run");
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
		
	}
}