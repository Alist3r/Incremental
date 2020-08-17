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
		response.sendRedirect(Costanti.URL_REDIRECT_PAGE);
	}	
	else {
		//Se ho effettuato il login, prendo l'oggetto Utente e tutti gli attributi in sessione
		utente = (Utente) session.getAttribute(Costanti.ATTR_UTENTE);
		parametriSession = (HashMap<String, Object>) session.getAttribute(Costanti.ATTR_PARAM_LIST);
	}


%>

<div class="div-container-header">
	<table class="table-header">
   		<tr>
   			<td style="border-right: 1px solid white;"><a href="#" class="a-header" style="cursor: default;"><%=utente.getUsername() %></a></td>
   			<td><a href="/Incremental/logout" class="a-header">Logout</a></td>
   		</tr>
   	</table>

</div>