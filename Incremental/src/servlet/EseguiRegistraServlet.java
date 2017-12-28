package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oggetti.*;
import utility.Costanti;
import utility.Procedure;
import dao.UtenteDao;

@SuppressWarnings("serial")
public class EseguiRegistraServlet extends BaseServlet {

	@Override
	protected void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 0 = Non registrato
		 * 1 = Registrato
		 * 2 = Email già esistente
		 */
		int registrato = 0;
		
		//Prendo i parametri dalla request
		String email = request.getParameter("email");
		String psw = request.getParameter("psw");
		
		UtenteDao utenteDao;
		Utente utente = null;
		try {
			//carico il dao e provo a cercare la combinazione email + password
			utenteDao = new UtenteDao();
			registrato = utenteDao.inserisciUtente(email,psw);
		}  catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}	
		
		String toPage = "";
		String messaggio = "";
		if (utente != null) {
			//se l'oggetto utente non è null allora ho trovato la combinazione di parametri e quindi eseguo il login
			loggato = true;
			request.getSession().setAttribute(Costanti.ATTR_LOGGATO, loggato);
			request.getSession().setAttribute(Costanti.ATTR_UTENTE, utente);
			toPage = "run";
		}
		else {
			//altrimento torno nella home senza eseguire il login
			toPage = "home";
			messaggio = "Utente non trovato";
			request.getSession().setAttribute(Costanti.ATTR_MSG, messaggio);
		}
		
		request.getSession().setAttribute("toPage", toPage);
		String url = Procedure.creaUrltoPage("redirect");
		request.getRequestDispatcher(url).forward(request, response);
	
	}
}