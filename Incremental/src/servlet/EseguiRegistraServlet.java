package servlet;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jasypt.util.password.BasicPasswordEncryptor;

import dao.StatsbaseDao;
import dao.UtenteDao;
import dao.VirtusDao;
import oggetti.utili.Messaggio;
import utility.Costanti;

@SuppressWarnings("serial")
public class EseguiRegistraServlet extends BaseServlet {

	@Override
	protected void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 0 = Non registrato
		 * 1 = Registrato
		 * 2 = Username già esistente
		 */
		int registrato = 0;
		
		String username = request.getParameter("email"); //Prendo i parametri dalla request
		String psw = request.getParameter("psw");
				
		BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor(); //Crypt della password
		String encryptedPassword = passwordEncryptor.encryptPassword(psw);
			
		String usernameTrovato = null;
		try {
			UtenteDao utenteDao = new UtenteDao();
			usernameTrovato = utenteDao.trovaUsername(username); //Verifico se l'username è stato già utilizzato
			
			if (usernameTrovato != null)  //Se trovo un username uguale nel DB
				registrato = 2;
			
			else 
				registrato = utenteDao.inserisciUtente(username,encryptedPassword); //Altrimenti eseguo l'inserimento dei dati sul DB dell'utente			
		}
		catch (ClassNotFoundException | SQLException e) {
			registrato = 0;
			e.printStackTrace();	
		}	
		
		String toPage = "";
		Messaggio msg;
		if (registrato == 1) { //Se la registrazione è andata a buon fine
			
			//Inserisco virtus e stats di default
			try {
				UtenteDao utenteDao = new UtenteDao();
				int idUtente = utenteDao.getIdDaUsername(username);
				
				VirtusDao virtusDao = new VirtusDao();
				//virtusDao.inserisciVirtusDefault(idUtente);
				
				StatsbaseDao statsDao = new StatsbaseDao();
				statsDao.inserisciStatsDefault(idUtente);
				
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}			
			
			toPage = "home";
			msg = new Messaggio("Registrazione Effettuata", Costanti.COLOR_VERDE);		
		}
		else {
			toPage = "registrazione";
			if (registrato == 2) 	
				msg = new Messaggio("Username già Esistente", Costanti.COLOR_ROSSO);
			else 
				msg = new Messaggio("Registrazione non Effettuata", Costanti.COLOR_ROSSO);
		}
		
		request.getSession().setAttribute(Costanti.ATTR_MSG, msg);
		toRedirectPage(request, response, toPage);
	
	}
}