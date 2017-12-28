
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Vector"%>
<%@page import="oggetti.*"%>
<%@page import="utility.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>

<!DOCTYPE html>

<%
	session = request.getSession();

	Boolean logged = (Boolean) session.getAttribute(Costanti.ATTR_LOGGATO);
	String messaggio = (String) session.getAttribute(Costanti.ATTR_MSG);
	
	if(logged != null && logged == true) {
		session.setAttribute("toPage", "run");
		response.sendRedirect("/Incremental/html/pages/redirect.jsp");	
	}
	
%>

<html>

	<link href="https://fonts.googleapis.com/css?family=Marck+Script" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Great+Vibes|Marck+Script|Yellowtail" rel="stylesheet">
	<link href="<%=Costanti.CONTEXT_PATH%>/css/custom.css" rel="stylesheet" media="screen">
    
    <script type='text/javascript' src='/LoLChampCreator/dwr/interface/CCService.js'></script>
  	<script type='text/javascript' src='/LoLChampCreator/dwr/engine.js'></script>
    <script src="http://code.jquery.com/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function () {
			$('#buttonRegistra').click(function () {
				
				var email = $('#email').val();
				var psw = $('#psw').val();
				var confPsw = $('#confermaPsw').val();
				
				if(email == '' | psw == '' | confPsw == '') {
					$('.mess-errore').text("Compilare tutti i campi");
				}
				else {
					if(psw != confPsw) {					
						$('.mess-errore').text("Le password non corrispondono");
					}
					else {
						var url = "/Incremental/eseguiregistra?email=" + email + "&psw=" +psw;
					}
				}
				
	            return false;
				
			});	
			
		});		
	</script>
	
	
	<head>
		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    	<title>Incremental</title> 
	</head>
  
  	<body>
  	
  		<div class="div-container-header">
			<table class="table-header">
   				<tr>
   					<td><a href="/Incremental/home" class="a-header">Home</a></td>
   					<td><a href="/Incremental/registra" class="a-header">Registrati</a></td>
   				</tr>
   			</table>
		</div>
  		<div class="div-registrazione">
  			<p class="corsivo" style="font-size: 25px;margin: 3px;">Lega la tua anima al portale</p>
  			<input type="email" maxlength="50" id="email" placeholder="E-Mail" class="input-base"> 
  			<input type="password" id="psw" placeholder="Password" class="input-base"> 
  			<input type="password" id="confermaPsw" placeholder="Conferma Password" class="input-base"> 
  			<p class="mess-errore"><% if(messaggio != null) { %>  <%= messaggio %> <% session.setAttribute(Costanti.ATTR_MSG, null); } %>  </p>
  			<a class="a-base" id="buttonRegistra">Registra</a>
  		</div>

   	</body>
</html>