<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<% 
double n = 0;
String errorMessage = null;
try {
	 n = Double.parseDouble(request.getParameter("n"));

} catch (Exception ex) {
	errorMessage= "erro na leitura do parâmetro";
}	%>


<html>
<head>
<meta charset="ISO-8859-1">
<title>Tabuada</title>
</head>
<body>
<a href="Index.html">Voltar</a>


<h1> Tabuada</h1>

<%if (errorMessage != null) { %>
<div style="color:red"> <%=errorMessage %> </div>


<% }else{ %>


<table border = "1"> 
<tr>
<th> Índice </th>
<th> Número </th>
 </tr>
 <% for(int  i=1; i<=n; i++){ %>
 <tr>
 
 <th> <%= i %> </th>
 <td> <%= (int) (Math.random()*100) %> </td>
 
 </tr>
 <% }} %>

</table>








<h2> Nova tabuada</h2>

<form>	
<input type="number" name="n"/>
<input type="submit" name="random" value="gerar"/>
</form>



</body>
</html>