package utility;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import dao.CapitoloDao;
import dao.StatsbaseDao;
import dao.VirtusDao;
import oggetti.Statsbase;
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
	
	/**public static ArrayList<Virtus> caricaListaVirtus(int idUtente) {
		
		ArrayList<Virtus> listaVirtus = new ArrayList<Virtus>();
		
		try {
			VirtusDao virtusDao = new VirtusDao();
			listaVirtus = virtusDao.getVirtusUtente(idUtente);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return listaVirtus;
	}**/
	
	public static ArrayList<Statsbase> caricaListaStatsbase(int idUtente) {
		
		ArrayList<Statsbase> listaStatsBase = new ArrayList<Statsbase>();
		
		try {
			StatsbaseDao statsDao = new StatsbaseDao();
			listaStatsBase = statsDao.getStatsUtente(idUtente);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return listaStatsBase;
	}
	
	public static String caricaCapitolo(int idUtente) {
		
		String capitolo = ""; 
		
		try {
			CapitoloDao capDao = new CapitoloDao();
			capitolo = capDao.getUltimoCapitolo(idUtente);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return capitolo;
	}
	
	public static HashMap<String, Object> caricaDatiUtente(int idUtente) {
		
		HashMap<String, Object> parametriSession = new HashMap<String, Object>();		
		
		//ArrayList<Virtus> listaVirtus = caricaListaVirtus(idUtente);
		ArrayList<Statsbase> listaStatsbase = caricaListaStatsbase(idUtente);
		
			
		//parametriSession.put(Costanti.ATTR_VIRTUS, listaVirtus);
		parametriSession.put(Costanti.ATTR_STATS_BASE, listaStatsbase);
		
		return parametriSession;
	}
	
}
