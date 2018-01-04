package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jasypt.util.password.BasicPasswordEncryptor;

import dao.UtenteDao;
import oggetti.Utente;
import oggetti.utili.Messaggio;
import utility.Costanti;
import utility.Procedure;

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
			utente = utenteDao.getUtenteDaUsername(username);					
		}  
		catch (ClassNotFoundException | SQLException e) {
			loggato = false;
			e.printStackTrace();
		}	
		
		BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor();
		String toPage = "";
		Messaggio msg = null;
		if (utente != null && passwordEncryptor.checkPassword(psw, utente.getPassword())) {
			//se l'oggetto utente non è null allora ho trovato la combinazione di parametri e quindi eseguo il login
			loggato = true;
			
			HashMap<String, Object> parametriSession = Procedure.caricaDatiUtente(utente.getIdUtente());
			
			request.getSession().setAttribute(Costanti.ATTR_LOGGATO, loggato);
			request.getSession().setAttribute(Costanti.ATTR_UTENTE, utente);
			request.getSession().setAttribute(Costanti.ATTR_PARAM_LIST, parametriSession);

			toPage = "run";
		}
		else {
			//altrimento torno nella home senza eseguire il login
			toPage = "home";
			msg = new Messaggio("Utente non trovato",Costanti.COLOR_ROSSO);
			request.getSession().setAttribute(Costanti.ATTR_MSG, msg);
		}
				
		toRedirectPage(request, response, toPage);
	
	}
}