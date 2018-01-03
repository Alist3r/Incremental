
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Vector"%>
<%@page import="oggetti.*"%>
<%@page import="utility.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>

<!DOCTYPE html>

<%
	session = request.getSession();

	Boolean logged = (Boolean) session.getAttribute(Costanti.ATTR_LOGGATO);
	Utente utente = new Utente();
	
	if(logged == null || logged == false) {
		session.setAttribute("toPage", "home");
		response.sendRedirect("/Incremental/html/pages/redirect.jsp");
	}	
	else {
		utente = (Utente) session.getAttribute(Costanti.ATTR_UTENTE);
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
	
	
	<head>
		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    	<title>Incremental</title> 
	</head>
  
  	<body>
  	
  		<jsp:include page="header/header.jsp"></jsp:include>
  		Email: <%= utente.getUsername() %>
  		Id: <%= utente.getIdUtente() %> 

   	</body>
</html>