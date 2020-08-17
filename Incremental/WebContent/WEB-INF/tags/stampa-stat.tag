<%@tag import="utility.Costanti"%>
<%@tag language="java" pageEncoding="UTF-8"%>

<%@attribute name="stat" required="true" type="oggetti.Statsbase" %>


	<%  %>
	
	<td class="tooltip" data-tooltip-content="#tooltip_stat_<%= stat.getIdStatsbase() %>" colspan="2">
		<div style="margin-right: 20px; border: 1px  #474747;">
			<span style="padding:2px;">
				<img style="margin-top:3px;" src="images/icone/icona-<%= stat.getAbbrev() %>.png" alt="icona-dannofisico">
			</span>
			<span style="font-size: 28px; width: 20px; height: 40px; background-color: #; color:#; padding: 1px;">
				<%= stat.getValoreTot() %>
			</span>
		</div>
		<div class="tooltip_templates" style="margin-top: 10px; font-size: 16px;">				
			<span id="tooltip_stat_<%= stat.getIdStatsbase() %>">
				<span style="float: right;margin-bottom: 3px;"><%= stat.getNome() %> -<%= stat.getAbbrev() %>-</span><br>
				<span class="corsivo-medium"><%= stat.getDescrizione() %></span>
				<br><br>					
				<span style="margin:0 auto; width: 100px; height: 30px; background-color: white;"></span>				
				<span style="font-style: italic;">~ Base: +<%= stat.getValoreBase() %></span><br>
				<span style="font-style: italic;">~ Da Equipaggiamento: +<%= stat.getBonusEquip() %></span><br>
				<span style="font-style: italic;">~ Da Abilità: +<%= stat.getBonusTalento() %></span><br>
			</span>
		</div>		
	
	</td>
	
	


