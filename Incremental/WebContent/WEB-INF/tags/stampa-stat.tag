<%@tag import="utility.Costanti"%>
<%@tag language="java" pageEncoding="UTF-8"%>

<%@attribute name="stat" required="true" type="oggetti.Statsbase" %>

<tr class="tooltip" data-tooltip-content="#tooltip_<%= stat.getIdStatsbase() %>">
	<%  %>
	<td style="width: 180px;">¬ <%= stat.getNome() %>:</td>	 
			<td class="td-valore"> <%= stat.getValoreTot() %><% if (stat.getIdStatsbase() == Costanti.STAT_ID_CHANCECRIT || stat.getIdStatsbase() == Costanti.STAT_ID_EVASIONE) {%>% <%}%>
				<div class="tooltip_templates" style="margin-top: 10px; font-size: 16px;">				
					<span id="tooltip_<%= stat.getIdStatsbase() %>">
						<span class="corsivo-medium"><%= stat.getDescrizione() %></span><br><br>	
						<span style="margin:0 auto; width: 100px; height: 30px; background-color: white;"></span>				
						<span style="font-style: italic;">~ Base: +<%= stat.getValoreBase() %></span><br>
						<span style="font-style: italic;">~ Da Equipaggiamento: +<%= stat.getBonusEquip() %></span><br>
						<span style="font-style: italic;">~ Da Virtus: +<%= stat.getBonusVirtus() %></span><br>
						<span style="font-style: italic;">~ Da Abilità: +<%= stat.getBonusAbilita() %></span><br>
					</span>
				</div>		
			</td>			
</tr>

