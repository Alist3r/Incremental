<%@page import="java.util.*"%>
<%@page import="oggetti.*"%>
<%@page import="utility.*"%>


<!DOCTYPE html>

<%
	session = request.getSession();
	
	Boolean logged = (Boolean) session.getAttribute(Costanti.ATTR_LOGGATO);
	HashMap<String, Object> parametriSession = new HashMap<String, Object>();
	
	Utente utente = new Utente();
	if(logged == null || logged == false) {
		session.setAttribute("toPage", "home");
		response.sendRedirect("/Incremental/html/pages/redirect.jsp");
	}	
	else {
		//Se ho effettuato il login, prendo l'oggetto Utente e tutti gli attributi in sessione
		utente = (Utente) session.getAttribute(Costanti.ATTR_UTENTE);
		parametriSession = (HashMap<String, Object>) session.getAttribute(Costanti.ATTR_PARAM_LIST);
	}

	ArrayList<Virtus> listaVirtus = (ArrayList<Virtus>) parametriSession.get(Costanti.ATTR_VIRTUS);
	
%>
	
	<table class="table-lista-virtus">
		<thead>
			<tr>
			 <td colspan="2" style="width: 200px"> LE TUE VIRTUS  </td>
			</tr>		
		</thead>
		
			<% 
		for(int i=0; i<11; i++) { %>
			<tr>
	  			<td style="width: 150px;">¬ <%= listaVirtus.get(i).getNome() %></td>	 
	  			<td><%= listaVirtus.get(i).getValore() %> </td>
  			</tr>
		<% } %>
		
	</table>
	
	
	
	
