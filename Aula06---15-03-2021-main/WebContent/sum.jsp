<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<% 
double n1 = 0, n2= 0, soma = 0;
String errorMessage = null;
try {
	 n1 = Double.parseDouble(request.getParameter("n1"));
	 n2 = Double.parseDouble(request.getParameter("n2"));
	 soma = n1+n2;
} catch (Exception ex) {
	errorMessage= "erro na leitura do parâmetros";
}	%>


<html>
<head>
<meta charset="ISO-8859-1">
<title>Soma</title>
</head>
<body>
<a href="Index.html">Voltar</a>
<h1> Soma JSP</h1>

<h2> soma de dois números:</h2>
<%if (errorMessage != null) { %>
<div style="color:red"> <%=errorMessage %> </div>


<% }else{ %>
<div> <%= n1 %></div>+
<div> <%= n2 %></div> = 
<div> <%= soma %></div>
<% } %>


<h2> nova soma</h2>

<form>
<input type="number" name="n1"/>+
<input type="number" name="n2"/>
<input type="submit" name="sum" value="="/>
</form>



</body>
</html>