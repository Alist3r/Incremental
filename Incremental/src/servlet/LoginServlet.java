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
				
		String username = request.getParameter("email"); //Prendo i parametri dalla request
		String psw = request.getParameter("psw");
		
		UtenteDao utenteDao;
		Utente utente = null;
		Boolean loggato = false;
		try {		
			utenteDao = new UtenteDao(); //carico il dao e provo a cercare la combinazione email + password
			utente = utenteDao.getUtenteDaUsername(username);					
		}  
		catch (ClassNotFoundException | SQLException e) {
			loggato = false;
			e.printStackTrace();
		}	
		
		BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor();
		String toPage = "";
		Messaggio msg = null;
		if (utente != null && passwordEncryptor.checkPassword(psw, utente.getPassword())) { //se l'oggetto utente non è null eseguo il login
			
			loggato = true;
			HashMap<String, Object> parametriSession = Procedure.caricaDatiUtente(utente.getIdUtente()); //Carico i dati necessari associati all'utente in un hashmap
			
			String capitolo = Procedure.caricaCapitolo(utente.getIdUtente());
			 //Carico quello che mi serve nella session
			request.getSession().setAttribute(Costanti.ATTR_UTENTE, utente);
			request.getSession().setAttribute(Costanti.ATTR_CAPITOLO, capitolo);
			request.getSession().setAttribute(Costanti.ATTR_PARAM_LIST, parametriSession);

			toPage = "run";
		}
		else { //altrimenti torno nella home senza eseguire il login
			
			msg = new Messaggio("Utente non trovato",Costanti.COLOR_ROSSO);
			request.getSession().setAttribute(Costanti.ATTR_MSG, msg);
			
			toPage = "home";
		}
				
		request.getSession().setAttribute(Costanti.ATTR_LOGGATO, loggato);
		toRedirectPage(request, response, toPage);
	
	}
}