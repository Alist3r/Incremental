
<%@page import="java.util.*"%>
<%@page import="oggetti.*"%>
<%@page import="utility.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>

<!DOCTYPE html>

<%
	session = request.getSession();

	Boolean logged = (Boolean) session.getAttribute(Costanti.ATTR_LOGGATO);
	HashMap<String, Object> parametriSession = new HashMap<String, Object>();
	String capitolo = "";
	
	Utente utente = new Utente();
	if(logged == null || logged == false) {
		session.setAttribute("toPage", "home");
		response.sendRedirect(Costanti.URL_REDIRECT_PAGE);
	}	
	else {
		//Se ho effettuato il login, prendo l'oggetto Utente e tutti gli attributi in sessione
		utente = (Utente) session.getAttribute(Costanti.ATTR_UTENTE);
		parametriSession = (HashMap<String, Object>) session.getAttribute(Costanti.ATTR_PARAM_LIST);			
		capitolo = (String) session.getAttribute(Costanti.ATTR_CAPITOLO);
	}
	
	
%>

<html>

	<link href="https://fonts.googleapis.com/css?family=Marck+Script" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Great+Vibes|Marck+Script|Yellowtail|Cookie|Damion|Berkshire+Swash|Satisfy|Niconne|Rancho" rel="stylesheet">
	<link href="<%=Costanti.CONTEXT_PATH%>/css/custom.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" type="text/css" href="<%=Costanti.CONTEXT_PATH%>/css/tooltipster.bundle.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=Costanti.CONTEXT_PATH%>/css/tooltipster-sideTip-borderless.min.css" />
    
    <script type='text/javascript' src='/Incremental/dwr/engine.js'></script>
  	<script type='text/javascript' src='/Incremental/dwr/interface/CCService.js'></script>
    <script src="http://code.jquery.com/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/tooltipster.bundle.min.js"></script>
	
	
	
	<head>
		 <script>
	        $(document).ready(function() {
	        	$('.tooltip').tooltipster({
	        	    theme: 'tooltipster-customized',
	        	    delay: 80,
	        	    side: 'right',
	        	    distance: 5,
	        	    animation: 'fade',
	        	    animationDuration: 150,
	        	    maxWidth: 220
	        	});
	        });
   		 </script>
	
		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    	<title>Incremental</title> 
	</head>
  
  	<body>
  	
  		<jsp:include page="header/header.jsp"></jsp:include>
  		<table class="table-main-container">
  			<tr>
  				<td style="width:24%"> 		
  							
					<jsp:include page="colonna-sinistra/elenco-stats.jsp"></jsp:include> 
  					<br>
  					<!--<jsp:include page="colonna-sinistra/elenco-virtus.jsp"></jsp:include>-->
  									
  				</td>
  				<td class="td-main-panel"> 
  					<div class="div-main">
  						<% String percorsoCapitolo = "storia/" +  capitolo + ".jsp"; %>
  						<jsp:include page="<%= percorsoCapitolo %>"></jsp:include> 
  					</div>
  				
  				</td>
  				<td style="width:24%"><jsp:include page="colonna-destra/dizionario.jsp"></jsp:include>  </td>
  			</tr>
  		</table>
  			
   	</body>
</html>