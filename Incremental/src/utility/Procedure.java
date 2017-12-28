package utility;

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
	
}
