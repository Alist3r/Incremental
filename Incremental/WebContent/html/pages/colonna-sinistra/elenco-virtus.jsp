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
	ArrayList<Statsbase> listaStats = (ArrayList<Statsbase>) parametriSession.get(Costanti.ATTR_STATS_BASE);
%>
	
	<table class="table-lista-virtus">
		<thead>
			<tr>
			 <td colspan="2" style="width: 200px"> LE TUE VIRTUS  </td>
			</tr>		
		</thead>
		
			<% 
		for(int i=0; i<5; i++) { %>
			<% Virtus virtus = listaVirtus.get(i);  %>
			<tr class="tooltip" data-tooltip-content="#tooltip_virtus_<%= virtus.getIdVirtus() %>">
	  			<td style="width: 180px;">¬ <%= virtus.getNome() %></td>	 
	  			<td class="td-valore"><%= virtus.getValore() %> 
	  			
	  			<div class="tooltip_templates" style="margin-top: 10px; font-size: 16px;">				
					<span id="tooltip_virtus_<%= virtus.getIdVirtus() %>">
						<span class="corsivo-medium"><%= virtus.getDescrizione() %></span><br><br>
						<%
						String stat1 = listaStats.get(virtus.getIdStatsbase1() -1).getNome();
						String stat2 = listaStats.get(virtus.getIdStatsbase2() -1).getNome();
						
						%>
						<span style="font-style: italic;">+ <%= stat1 %></span><br>	
						<span style="font-style: italic;">+ <%= stat2 %></span><br>						
					</span>
				</div>	
	  			
	  			
	  			</td>
  			</tr>
		<% } %>
		
	</table>
	
	
	
	
