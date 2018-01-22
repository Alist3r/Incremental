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
	
	Statsbase pv = new Statsbase();
	Statsbase energia = new Statsbase();
	Statsbase res = new Statsbase();
	Statsbase chancecrit = new Statsbase();
	Statsbase ffisica = new Statsbase();
	Statsbase fmentale = new Statsbase();
	Statsbase evasione = new Statsbase();
	Statsbase pc = new Statsbase();
	Statsbase pa = new Statsbase();
	
	for (int i = 0; i < listaStats.size(); i++) {
		
		Statsbase stat = listaStats.get(i);
		switch(stat.getIdStatsbase()) {
			case Costanti.STAT_ID_PV:  pv = stat; break;
			case Costanti.STAT_ID_ENERGIA:  energia = stat; break;
			case Costanti.STAT_ID_RESISTENZA:  res = stat; break;
			case Costanti.STAT_ID_CHANCECRIT:  chancecrit = stat; break;
			case Costanti.STAT_ID_FFISICA:  ffisica = stat; break;
			case Costanti.STAT_ID_FMENTALE:  fmentale = stat; break;
			case Costanti.STAT_ID_EVASIONE:  evasione = stat; break;
			case Costanti.STAT_ID_PUNTICRESCITA:  pc = stat; break;
			case Costanti.STAT_ID_PUNTIABILITA:  pa = stat; break;							
		}		
	}
	
%>
	
	<table class="table-lista-stats">
		
			<tr>
				<td colspan="4">				
					<div class="tooltip" data-tooltip-content="#tooltip_pv" style="margin-top: 10px; font-size: 16px;"> 
						<b><%= pv.getAbbrev() %> <%= pv.getValoreAttuale() %>/<%= pv.getValoreTot() %> </b> 				
					</div>
					
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
  			<tr>
  				<td class="tooltip td-stats-punti" data-tooltip-content="#tooltip_pc" colspan="1"> 
  				<%= pc.getAbbrev() %>
  				
  					<div class="tooltip_templates" style="margin-top: 10px; font-size: 16px;">				
						<span id="tooltip_pc">
						 	<span><%= pc.getNome() %></span>
						 	<br>
						 	<br>
							<span class="corsivo-medium"><%= pc.getDescrizione() %></span>
							<br>					
						</span>
					</div>
  				
  				</td>
  				<td colspan="1" style="width: 25%;font-size:16px;"> 
  				<%=pc.getValoreTot() %>
  				</td>
  				<td class="tooltip td-stats-punti" data-tooltip-content="#tooltip_pa" colspan="1"> 
  				<%= pa.getAbbrev() %>
  				
  					<div class="tooltip_templates" style="margin-top: 10px; font-size: 16px;">				
						<span id="tooltip_pa">
						 	<span><%= pa.getNome() %></span>
						 	<br>
						 	<br>
							<span class="corsivo-medium"><%= pa.getDescrizione() %></span>
							<br>					
						</span>
					</div>
  				</td>
  				<td colspan="1" style="width: 25%;font-size:16px;"> 
  				<%=pa.getValoreTot() %>
  				</td>
  			</tr>
  			
			
  			<tag:stampa-stat stat="<%= energia %>"></tag:stampa-stat>
  			<tag:stampa-stat stat="<%= res %>"></tag:stampa-stat>
  			<tag:stampa-stat stat="<%= ffisica %>"></tag:stampa-stat>
  			<tag:stampa-stat stat="<%= fmentale %>"></tag:stampa-stat>
  			<tag:stampa-stat stat="<%= evasione %>"></tag:stampa-stat>
  			<tag:stampa-stat stat="<%= chancecrit %>"></tag:stampa-stat>
  			
	</table>
	
	
	
	
