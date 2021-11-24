<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<% 
double n = 0;
String errorMessage = null;
try {
	 n = Double.parseDouble(request.getParameter("n"));

} catch (Exception ex) {
	errorMessage= "erro na leitura do par�metro";
}	%>


<html>
<head>
<meta charset="ISO-8859-1">
<title>N�meros aleat�rios</title>
</head>
<body>
<a href="Index.html">Voltar</a>
<h1> Numeros aleat�rios</h1>

<%if (errorMessage != null) { %>
<div style="color:red"> <%=errorMessage %> </div>


<% }else{ %>


<table>
 <% for(int  i=1; i<=10; i++){ %>

 <tr>
 <td> <%= n %> </td>
 <td> x </td>
 <td> <%=i %> </td>
 <td> = </td>
 <td> <%= (n*i) %></td>
 
 </tr>
  <% } %>


</table>

<% } %>


	






<h2> Nova tabuada</h2>

<form>	
<input type="number" name="n"/>
<input type="submit" name="random" value="gerar"/>
</form>



</body>
</html>