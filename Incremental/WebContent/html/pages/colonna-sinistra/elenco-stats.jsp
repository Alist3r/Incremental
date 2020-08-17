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
		response.sendRedirect(Costanti.URL_REDIRECT_PAGE);
	}	
	else {
		//Se ho effettuato il login, prendo l'oggetto Utente e tutti gli attributi in sessione
		utente = (Utente) session.getAttribute(Costanti.ATTR_UTENTE);
		parametriSession = (HashMap<String, Object>) session.getAttribute(Costanti.ATTR_PARAM_LIST);
	}
	
	ArrayList<Statsbase> listaStats = (ArrayList<Statsbase>) parametriSession.get(Costanti.ATTR_STATS_BASE);
	
	Statsbase pv = new Statsbase();
	Statsbase pa = new Statsbase();
	Statsbase astuzia = new Statsbase();
	Statsbase coraggio = new Statsbase();
	Statsbase spirito = new Statsbase();
	Statsbase volonta = new Statsbase();
	Statsbase dfisico = new Statsbase();
	Statsbase dmagico = new Statsbase();
	Statsbase armatura = new Statsbase();
	
	for (int i = 0; i < listaStats.size(); i++) {
		
		Statsbase stat = listaStats.get(i);
		switch(stat.getIdStatsbase()) {
			case Costanti.STAT_ID_PV:  pv = stat; break;
			case Costanti.STAT_ID_PA:  pa = stat; break;
			case Costanti.STAT_ID_ASTUZIA:  astuzia = stat; break;
			case Costanti.STAT_ID_CORAGGIO:  coraggio = stat; break;
			case Costanti.STAT_ID_SPIRITO:  spirito = stat; break;
			case Costanti.STAT_ID_VOLONTA:  volonta = stat; break;
			case Costanti.STAT_ID_DANNOFISICO:  dfisico = stat; break;
			case Costanti.STAT_ID_DANNOMAGICO:  dmagico = stat; break;
			case Costanti.STAT_ID_ARMATURA:  armatura = stat; break;							
		}		
	}
	
%>
	
	<table class="table-lista-stats">
		
			<tr>
				<td colspan="1">				
					<div class="tooltip" data-tooltip-content="#tooltip_pv" style="margin-top: 10px; font-size: 16px;"> 
						<b><%= pv.getAbbrev() %> <%= pv.getValoreAttuale() %>/<%= pv.getValoreTot() %> </b> 				
					</div>
					
					<div class="tooltip_templates" style="margin-top: 10px; font-size: 16px;">				
						<span id="tooltip_pv">
							<span class="corsivo-medium"><%= pv.getDescrizione() %></span>
							<br><br>
							<span style="font-style: italic;">~ Base: +<%= pv.getValoreBase() %></span><br>
							<span style="font-style: italic;">~ Da Equipaggiamento: +<%= pv.getBonusEquip() %></span><br>
							<span style="font-style: italic;">~ Da Abilità: +<%= pv.getBonusTalento() %></span><br>
						</span>
					</div>
				</td>
				<td>	
					<div style="border: 1px solid #5c5c5c; width: 200px;height: 5px; margin-bottom: 5px; margin-left: 5px">
						<%
							int percVita = (pv.getValoreAttuale() * 100) / pv.getValoreTot();
							int width = percVita * 200 / 100;				
						%>
						<div style="width:<%= width %>px; background-color: #5c5c5c; height: 100%;"> </div>
					
					</div>
				</td>		
					
			</tr>
			<tr>
				<td colspan="1" class="tooltip" data-tooltip-content="#tooltip_pc" style="margin-top: 10px; font-size: 16px;"> 
  				<b><%= pa.getAbbrev() %> <%= pa.getValoreTot() %></b>
  				
  					<div class="tooltip_templates" style="margin-top: 10px; font-size: 16px;">				
						<span id="tooltip_pc">
						 	<span><%= pa.getNome() %></span>
						 	<br>
						 	<br>
							<span class="corsivo-medium"><%= pa.getDescrizione() %></span>
							<br>					
						</span>
					</div>
				</td>
				<td>
					<div>
  				<% for (int i=0; i<pa.getValoreTot();i++) { %>
  					<span style="float:left; margin-right: 3px;width: 10px;border: 1px solid #5c5c5c;background-color: #5c5c5c;height: 5px;margin-bottom: 5px; border-radius:8px; margin-left: 5px;"></span>
  				<% } %>
  				</div>
  				</td>	
			</tr>
		</table>
		<table class="table-lista-stats">
			<tr>
				<td colspan="4">
				<div style="border-bottom: 1px solid #474747; text-align:center; margin-bottom: 10px; margin-top: 10px;">
				 LE <b>V</b> I R T U S
				</div>
				</td>
			</tr>
  			<tr>
  				<td colspan="4">
					<tag:stampa-stat-virtus stat="<%= astuzia %>"></tag:stampa-stat-virtus>
					<tag:stampa-stat-virtus stat="<%= coraggio %>"></tag:stampa-stat-virtus>
					<tag:stampa-stat-virtus stat="<%= volonta %>"></tag:stampa-stat-virtus>
					<tag:stampa-stat-virtus stat="<%= spirito %>"></tag:stampa-stat-virtus>
				</td>				
  			</tr>
  			<tr>
				<td colspan="6">
				<div style="border-bottom: 1px solid #474747; text-align:center; margin-bottom: 10px; margin-top: 10px;">
				 IN <b>C</b> O M B A T T I M E N T O
				</div>
				</td>
			</tr>	
  		</table>
  		<table class="table-lista-stats">
  			
			<tr>	
	  			<tag:stampa-stat stat="<%= dfisico %>"></tag:stampa-stat>
	  			<tag:stampa-stat stat="<%= dmagico %>"></tag:stampa-stat>
	  			<tag:stampa-stat stat="<%= armatura %>"></tag:stampa-stat>
  			</tr>
	</table>
	
	
	
	
