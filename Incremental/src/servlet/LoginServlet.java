package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jasypt.util.password.BasicPasswordEncryptor;

import oggetti.*;
import utility.Costanti;
import utility.Procedure;
import dao.UtenteDao;

@SuppressWarnings("serial")
public class LoginServlet extends BaseServlet {

	@Override
	protected void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Boolean loggato = false;
		
		//Prendo i parametri dalla request
		String username = request.getParameter("email");
		String psw = request.getParameter("psw");
		
		UtenteDao utenteDao;
		Utente utente = null;
		try {
			//carico il dao e provo a cercare la combinazione email + password
			utenteDao = new UtenteDao();
			utente = utenteDao.getDaUsername(username);
					
		}  
		catch (ClassNotFoundException | SQLException e) {
			loggato = false;
			e.printStackTrace();
		}	
		
		BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor();
		String toPage = "";
		String messaggio = "";
		if (utente != null && passwordEncryptor.checkPassword(psw, utente.getPassword())) {
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