package servlet;


import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UtenteDao;
import utility.Costanti;
import utility.Procedure;

import org.jasypt.util.password.BasicPasswordEncryptor;

@SuppressWarnings("serial")
public class EseguiRegistraServlet extends BaseServlet {

	@Override
	protected void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* 0 = Non registrato
		 * 1 = Registrato
		 * 2 = Username già esistente
		 */
		int registrato = 0;
		
		//Prendo i parametri dalla request
		String username = request.getParameter("email");

		String psw = request.getParameter("psw");
		
		UtenteDao utenteDao;
		String usernameTrovato = null;
		
		BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor();
		String encryptedPassword = passwordEncryptor.encryptPassword(psw);
		
		try {
			utenteDao = new UtenteDao();
			usernameTrovato = utenteDao.trovaUsername(username);
			
			if (usernameTrovato != null) {
				registrato = 2;
			}
			else {
				registrato = utenteDao.inserisciUtente(username,encryptedPassword);
			}
		}
		catch (ClassNotFoundException | SQLException e) {
			registrato = 0;
			e.printStackTrace();	
		}	
		
		String toPage = "";
		String messaggio = "";
		if (registrato == 1) {
			toPage = "home";
			messaggio = "Registrazione Effettuata";
			
		}
		else {
			toPage = "registrazione";
			if (registrato == 2)			
				messaggio = "Username Esistente";
			
			else 
				messaggio = "Registrazione non effettuata";				
		}
		
		request.getSession().setAttribute(Costanti.ATTR_MSG, messaggio);
		request.getSession().setAttribute("toPage", toPage);
		String url = Procedure.creaUrltoPage("redirect");
		request.getRequestDispatcher(url).forward(request, response);
	
	}
}