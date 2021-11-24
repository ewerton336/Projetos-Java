<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="db.User"%>
<%@page import="db.Disciplinas"%>
  <%@include file="WEB-INF/jspf/header.jspf" %>
  <%
    String requestError = null;
    ArrayList<Disciplinas> list = new ArrayList<>();
    try{
         if(request.getParameter("nota")!=null){
        	  String name = request.getParameter("name");
            String p1 = request.getParameter("p1");
            String p2 = request.getParameter("p2");
            Disciplinas.update(p1, p2, name);
            response.sendRedirect(request.getRequestURI());
        }
        list = Disciplinas.getList();
    }catch(Exception ex){
        requestError = ex.getMessage();
    }
%>


 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inicio - SigaCopy</title>
</head>
<body>

<table border = "">
<tr>
<th> Matrícula: </th>
 <th> Nome completo: </th>
<th>  Semestre que ingressou: </th>
<th>  Github:</th>
</tr>
<tr><td>1290482013015</td>
<td>Ewerton Guimaraes</td>
<td>1</td>
<td><a href="https://github.com/ewerton336"> Clique para acessar</a></td></tr>
</table>


  <%if(session.getAttribute("user.login") == null){%>
            <div><br>Faça login para visualizar as notas</div>
        <%}else{%>
        
        
         <h1>Notas</h1>
        
        <table border="1">
            <tr>
                <th>Materia</th>
                <th>p1</th>
                <th>p2</th>
                <th> Média </th>
            </tr>
            <%for(Disciplinas d: list){%>
             
                <tr>
                    <td><%= d.getName() %></td>
                   	<td><%= d.getP1() %></td>
                    <td><%= d.getP2() %></td>
                    <%int media = (Integer.parseInt(d.getP1()) + Integer.parseInt(d.getP2())) / 2; %>
                    <td><%= media%></td> 
                </tr>
            <%}}%>
        </table>










</body>
</html>