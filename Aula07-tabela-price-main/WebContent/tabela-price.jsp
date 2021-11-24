<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale"%>

<%

double valor = Double.parseDouble(request.getParameter("valor"));
double juros = Double.parseDouble(request.getParameter("juros"));
double meses = Double.parseDouble(request.getParameter("meses"));
double juros2 = juros/100;
int intmeses = (int) meses;
double poten1 = Math.pow((1+juros2), meses) * juros2;
double poten2 = Math.pow((1+juros2), meses) - 1;
double parcela = valor * (poten1/poten2);
double devedor = (valor - parcela);
double juros3 = valor * juros2;
double parcela2 = valor - devedor;
int i = 1;
Locale localePT = new Locale( "pt", "BR" );
NumberFormat dinheiro = NumberFormat.getCurrencyInstance(localePT);
%>

<html>
<head>	
 <%-- OBTER BOOTSTRAP --%>
  <%@include file="WEB-INF/jspf/bootstrap.jspf" %>
<meta charset="ISO-8859-1">


 <%--INICIO --%>
<title>Calculadora Price</title>

</head>
<body>

 <%--OBTER HEADER --%>
        <%@include file="WEB-INF/jspf/header.jspf" %>

<h4> Valor a financiar: <%= (dinheiro.format(valor)) %></h4>
<h4> Taxa de juros: <%= juros %>%</h4>
<h4> meses: <%= meses %></h4> <br> <br>


<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Período</th>
      <th scope="col">Saldo Devedor</th>
      <th scope="col">Parcela</th>
      <th scope="col">Juros</th>
       <th scope="col">Amortização</th>
    </tr>
  </thead>
  
  <tbody>
   <%--LINHA 0 DA TABELA --%>
   <tr>
      <th scope="row">0</th>
      <td><%=(dinheiro.format(valor)) %></td>
      <td></td>
      <td></td>
        <td></td>
    </tr>
    <tr>
    
     <%--LINHA 1 EM DIANTE DA TABELA --%>
    <%do { %>
     <% valor = (valor + juros3) - parcela2; %>
      <th scope="row"><%=i %></th> <%--PERIODO --%>
      <td> <%=(dinheiro.format(valor))%></td> <%-- SALDO DEVEDOR --%>
      <td> <%=(dinheiro.format(parcela2)) %></td> <%--PARCELA --%>
      <td> <%= (dinheiro.format(juros3)) %></td>  <%-- JUROS --%>
        <td><%=(dinheiro.format(parcela2-juros3)) %></td> <%-- AMORTIZACAO --%>
        <%juros3 = valor * juros2; %>
       
    </tr>
   
    	<% devedor = valor  ; %>
        <% devedor = valor - parcela;%>
        <%i++; %>
    <% }while (i <=intmeses); %>
  </tbody>
</table>

<h2> Novo cálculo</h2>
<form action="tabela-price.jsp">
<h4>Valor a financiar (R$): </h4><input type="number" name="valor"/>  <br>
<h4>Taxa de juros mensal %: </h4><input type="number" name="juros"/> <br>
<h4>Quantidade de meses: </h4><input type="number" name="meses"/>  <br>
<input type="submit" name="random" value="calcular"/>
</form>


  <%@include file="WEB-INF/jspf/footer.jspf" %>
</body>
</html>