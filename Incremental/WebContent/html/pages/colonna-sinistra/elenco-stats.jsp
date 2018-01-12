<%@taglib prefix="tag" tagdir="/WEB-INF/tags"%>

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
	
	ArrayList<Statsbase> listaStats = (ArrayList<Statsbase>) parametriSession.get(Costanti.ATTR_STATS_BASE);
	
%>
	
	<table class="table-lista-stats">
		
			<tr>
				<td colspan="2">
				
				<%
				Statsbase pv = 			listaStats.get(Costanti.STAT_ID_PV -1);
				Statsbase energia = 	listaStats.get(Costanti.STAT_ID_ENERGIA -1);
				Statsbase res = 		listaStats.get(Costanti.STAT_ID_RESISTENZA -1);
				Statsbase chancecrit = 	listaStats.get(Costanti.STAT_ID_CHANCECRIT -1);
				Statsbase ffisica = 	listaStats.get(Costanti.STAT_ID_FFISICA -1);
				Statsbase fmentale = 	listaStats.get(Costanti.STAT_ID_FMENTALE -1);
				Statsbase evasione = 	listaStats.get(Costanti.STAT_ID_EVASIONE -1);
				%>
				
				<div class="tooltip" data-tooltip-content="#tooltip_pv" style="margin-top: 10px; font-size: 16px;"> <b>PV <%= pv.getValoreAttuale() %>/<%= pv.getValoreTot() %> </b> </div>
				
				<div class="tooltip_templates" style="margin-top: 10px; font-size: 16px;">				
					<span id="tooltip_pv">
						<span class="corsivo-medium"><%= pv.getDescrizione() %></span>
						<br><br>
						<span style="font-style: italic;">~ Base: +<%= pv.getValoreBase() %></span><br>
						<span style="font-style: italic;">~ Da Equipaggiamento: +<%= pv.getBonusEquip() %></span><br>
						<span style="font-style: italic;">~ Da Virtus: +<%= pv.getBonusVirtus() %></span><br>
						<span style="font-style: italic;">~ Da Abilità: +<%= pv.getBonusAbilita() %></span><br>
					</span>
				</div>
				
				<div style="border: 1px solid #5c5c5c; width: 200px;height: 5px; margin-bottom: 5px;">
					<%
						int percVita = (pv.getValoreAttuale() * 100) / pv.getValoreTot();
						int width = percVita * 200 / 100;				
					%>
					<div style="width:<%= width %>px; background-color: #5c5c5c; height: 100%;"> </div>
				
				</div>
				</td>
			</tr>
  			
  			<tag:stampa-stat stat="<%= energia %>"></tag:stampa-stat>
  			<tag:stampa-stat stat="<%= res %>"></tag:stampa-stat>
  			<tag:stampa-stat stat="<%= ffisica %>"></tag:stampa-stat>
  			<tag:stampa-stat stat="<%= fmentale %>"></tag:stampa-stat>
  			<tag:stampa-stat stat="<%= evasione %>"></tag:stampa-stat>
  			<tag:stampa-stat stat="<%= chancecrit %>"></tag:stampa-stat>
  			
	</table>
	
	
	
	
