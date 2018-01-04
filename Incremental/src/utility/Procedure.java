package utility;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import dao.VirtusDao;
import oggetti.Virtus;

public final class Procedure {

	public static String creaContextUrltoServlet(String servlet) {
		String urlCompleto = "";		
		urlCompleto = Costanti.CONTEXT_PATH + servlet;	
		return urlCompleto;					
	}
	
	public static String creaUrltoPage(String page) {
		String urlCompleto = "";		
		urlCompleto = "html/pages/" + page + ".jsp";	
		return urlCompleto;	
	}
	
	public static HashMap<String, Object> caricaDatiUtente(int idUtente) {
		
		HashMap<String, Object> parametriSession = new HashMap<String, Object>();
		ArrayList<Virtus> listaVirtus = new ArrayList<Virtus>();
		
		try {
			//CaricaVirtus
			VirtusDao virtusDao = new VirtusDao();
			listaVirtus = virtusDao.getVirtusUtente(idUtente);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		parametriSession.put(Costanti.ATTR_VIRTUS, listaVirtus);
		
		return parametriSession;
	}
	
}
