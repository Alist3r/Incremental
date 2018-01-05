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
	}
	
%>
	
	<table class="table-lista-stats">
		
			<tr>
				<td colspan="4">
				<div style="margin-top: 10px; font-size: 16px;"><b>PV <%= utente.getPvAttuali() %>/<%= utente.getPvMax() %> </b></div>
				<div style="border: 1px solid #5c5c5c; width: 200px;height: 3px; margin-bottom: 5px;">
					<%
						int percVita = (utente.getPvAttuali() * 100) / utente.getPvMax();
						int width = percVita * 200 / 100;				
					%>
					<div style="width:<%= width %>px; background-color: #5c5c5c; height: 100%;"> </div>
				
				</div>
				</td>
			</tr>
  			
  			<tr>
	  			<td style="width: 150px;">¬ Punti Azione</td>	 
	  			<td><%= utente.getPaAttuali()  %> </td>
	  			<td>/<%= utente.getPaMax()  %> </td>
	  			<td> (+<%= utente.getPaBonus()  %>) </td>
  			</tr>	
  			
  			<tr>
	  			<td style="width: 150px;">¬ Resistenza</td>	 
	  			<td></td>
	  			<td><%= utente.getResistenza()  %> </td>
	  			<td>(+<%= utente.getResistenzaBonus()  %>) </td>
  			</tr>
  			
  			<tr>
	  			<td style="width: 150px;">¬ Chance Critico</td>	 
	  			<td></td>
	  			<td><%= utente.getChanceCrit()  %> </td>
	  			<td>(+<%= utente.getChanceCritBonus()  %>) </td>
  			</tr>
  			
  			<tr>
	  			<td style="width: 150px;">¬ Danno Critico</td>	 
	  			<td></td>
	  			<td><%= utente.getDannoCrit()  %> </td>
	  			<td>(+<%= utente.getDannoCritBonus()  %>) </td>
  			</tr>
  			
  			<tr>
	  			<td style="width: 150px;">¬ Evasione</td>	 
	  			<td></td>
	  			<td><%= utente.getEvasione()  %> </td>
	  			<td>(+<%= utente.getEvasioneBonus()  %>) </td>
  			</tr>
  			
  			<tr>
	  			<td style="width: 150px;">¬ Precisione</td>	 
	  			<td></td>
	  			<td><%= utente.getPrecisione()  %> </td>
	  			<td>(+<%= utente.getPrecisioneBonus()  %>) </td>
  			</tr>
	</table>
	
	
	
	
