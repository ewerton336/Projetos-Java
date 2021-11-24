<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<a href="Index.html">Voltar</a>
<h1> JSP</h1>

<h2> Data / Hora: </h2>
<h3>...com scriptlet</h3>
<%
java.util.Date now = new java.util.Date();
out.println(now);	
%>
<h3>...com Expression</h3>
<%= new java.util.Date() %>

</body>
</html>