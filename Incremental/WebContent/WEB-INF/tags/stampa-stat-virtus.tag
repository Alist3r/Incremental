<%@tag import="utility.Costanti"%>
<%@tag language="java" pageEncoding="UTF-8"%>

<%@attribute name="stat" required="true" type="oggetti.Statsbase" %>

<div class="tooltip" data-tooltip-content="#tooltip_stat_<%= stat.getIdStatsbase() %>" style="border: 1px solid black; width: 58px; height: 58px; padding: 1px; float: left; margin-right: 5px;">
<div style="text-align: center; font-size: 15px;background-color: #474747;color: #fff;padding:3px"><%= stat.getAbbrev() %></div> 
<div class="td-valore" style="text-align: center; font-size: 25px;"> <%= stat.getValoreTot() %></div>
	<div class="tooltip_templates" style="margin-top: 10px; font-size: 16px;">				
		<span id="tooltip_stat_<%= stat.getIdStatsbase() %>">
			<span style="float: right;margin-bottom: 3px;">-<%= stat.getNome() %>-</span><br>
			<span class="corsivo-medium"><%= stat.getDescrizione() %></span>
			<br><br>					
			<span style="margin:0 auto; width: 100px; height: 30px; background-color: white;"></span>				
			<span style="font-style: italic;">~ Base: +<%= stat.getValoreBase() %></span><br>
			<span style="font-style: italic;">~ Da Equipaggiamento: +<%= stat.getBonusEquip() %></span><br>
			<span style="font-style: italic;">~ Da Abilità: +<%= stat.getBonusTalento() %></span><br>
		</span>
	</div>	
</div>	

