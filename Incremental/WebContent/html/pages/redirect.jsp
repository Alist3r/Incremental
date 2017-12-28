
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Vector"%>
<%@page import="oggetti.*"%>
<%@page import="utility.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>

<!DOCTYPE html>

<%
		session = request.getSession();
	
		String url = Procedure.creaContextUrltoServlet("/Game");
		response.sendRedirect(url);	

%>

<html> 
  	<body>
  		
  		
   	</body>
</html>