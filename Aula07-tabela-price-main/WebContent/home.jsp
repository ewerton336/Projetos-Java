<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/bootstrap.jspf" %>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1>Bem vindo!</h1>
        
        
        <h1> Calculadora Tabela Price</h1>

<form action="tabela-price.jsp">
<h4>Valor a financiar (R$): </h4><input type="number" name="valor"/>  <br>
<h4>Taxa de juros mensal %: </h4><input type="number" name="juros"/> <br>
<h4>Quantidade de meses: </h4><input type="number" name="meses"/>  <br>
<input type="submit" name="random" value="calcular"/>
</form>
        
        
         <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
