
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Vector"%>
<%@page import="oggetti.*"%>
<%@page import="oggetti.utili.*"%>
<%@page import="utility.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>

<!DOCTYPE html>

<%
	session = request.getSession();

	Boolean logged = (Boolean) session.getAttribute(Costanti.ATTR_LOGGATO);
	Messaggio messaggio = (Messaggio) session.getAttribute(Costanti.ATTR_MSG);
		
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
    
    <script type='text/javascript' src='/Incremental/dwr/engine.js'></script>
  	<script type='text/javascript' src='/Incremental/dwr/interface/CCService.js'></script>
    <script src="http://code.jquery.com/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function () {
			$('#buttonLogin').click(function () {
				
				var email = $('#email').val();
				var psw = $('#psw').val();
				
				var url = "/Incremental/login?email=" + email + "&psw=" +psw;

	            window.location.href = url;
	            return false;
				
			});	
			
		});		
	</script>
	
	<!-- ######### -->
	
	<head>
		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    	<title>Incremental</title> 
	</head>
  
  	<body>
  		<div class="div-container-header">
			<table class="table-header">
   				<tr>
   					<td><a href="/Incremental/registra" id="buttonRegistrati" class="a-header">Registrati</a></td>
   				</tr>
   			</table>
		</div>
  		<div class="div-login">
  			<p class="corsivo" style="font-size: 25px;margin: 3px;">Attraversa il portale</p>
  			<input type="email" id="email" placeholder="Username" class="input-base"> 
  			<input type="password" id="psw" placeholder="Password" class="input-base"> 
  			<% if(messaggio != null) { %>
					<p class="messaggio" style="color:<%= messaggio.getColore() %>">  <%= messaggio.getMsg() %>   </p>
  			<% 		session.setAttribute(Costanti.ATTR_MSG, null); 
 				} %>
  			<a class="a-base" id="buttonLogin">Login</a>
  		</div>
  		

   	</body>
</html>