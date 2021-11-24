<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
 <%@include file="WEB-INF/jspf/bootstrap.jspf" %>
<head>
<meta charset="ISO-8859-1">
<title>Inicio</title>
</head>
<body>
 <%@include file="WEB-INF/jspf/header.jspf" %>

 
 
 <%if(session.getAttribute("session.username") == null){%>
<h4>Efetue login para visualizar a tabela</h4>
  
    
<%}else{%>


<%  if(request.getParameter("session.atualiza")!=null){
    if(!request.getParameter("session.poo1").isEmpty()){
        String username = request.getParameter("session.poo1");
        session.setAttribute("session.poo1", username);
    }
    }


if(request.getParameter("session.atualiza")!=null){
    if(!request.getParameter("session.poo2").isEmpty()){
        String username = request.getParameter("session.poo2");
        session.setAttribute("session.poo2", username);
    }
    }

if(request.getParameter("session.atualiza")!=null){
    if(!request.getParameter("session.eng3p1").isEmpty()){
        String username = request.getParameter("session.eng3p1");
        session.setAttribute("session.eng3p1", username);
    }
    }

if(request.getParameter("session.atualiza")!=null){
    if(!request.getParameter("session.eng3p2").isEmpty()){
        String username = request.getParameter("session.eng3p2");
        session.setAttribute("session.eng3p2", username);
    }
    }

if(request.getParameter("session.atualiza")!=null){
    if(!request.getParameter("session.edp1").isEmpty()){
        String username = request.getParameter("session.edp1");
        session.setAttribute("session.edp1", username);
    }
    }

if(request.getParameter("session.atualiza")!=null){
    if(!request.getParameter("session.edp2").isEmpty()){
        String username = request.getParameter("session.edp2");
        session.setAttribute("session.edp2", username);
    }
    }

if(request.getParameter("session.atualiza")!=null){
    if(!request.getParameter("session.edp2").isEmpty()){
        String username = request.getParameter("session.eng2p1");
        session.setAttribute("session.eng2p1", username);
    }
    }

if(request.getParameter("session.atualiza")!=null){
    if(!request.getParameter("session.eng2p2").isEmpty()){
        String username = request.getParameter("session.eng2p2");
        session.setAttribute("session.eng2p2", username);
    }
    }

if(request.getParameter("session.atualiza")!=null){
    if(!request.getParameter("session.sip1").isEmpty()){
        String username = request.getParameter("session.sip1");
        session.setAttribute("session.sip1", username);
    }
    }

if(request.getParameter("session.atualiza")!=null){
    if(!request.getParameter("session.sip2").isEmpty()){
        String username = request.getParameter("session.sip2");
        session.setAttribute("session.sip2", username);
    }
    }

if(request.getParameter("session.atualiza")!=null){
    if(!request.getParameter("session.bdp1").isEmpty()){
        String username = request.getParameter("session.bdp1");
        session.setAttribute("session.bdp1", username);
    }
    }


if(request.getParameter("session.atualiza")!=null){
    if(!request.getParameter("session.bdp2").isEmpty()){
        String username = request.getParameter("session.bdp2");
        session.setAttribute("session.bdp2", username);
    }
    }



%>
  
    
    
    <form>

  <table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Dia da semana</th>
      <th scope="col">Materia</th>
      <th scope="col">P1</th>
      <th scope="col">P2</th>
     
    </tr>
  </thead>
  
  <tbody>
   <%--LINHA 0 DA TABELA --%>
   <tr>
      <td>Segunda</td>
      <td>Programação Orientada a Objetos</td>
      
      
     <%if(session.getAttribute("session.poo1") == null){%>
<td> <input type="text" name="session.poo1" value = ""></td>
<td> <input type="text" name="session.poo2" value = ""></td>
<%} else { %>
        <td> <input type="text" name="session.poo1" value = <%= session.getAttribute("session.poo1") %>></td>
        <td><input type="text" name="session.poo2" value = <%= session.getAttribute("session.poo2") %>></td>
        <%} %>
    </tr>
    
    
    
       <tr>
      <td>Terça</td>
      <td>Egenharia de software 3</td>
      
      
     <%if(session.getAttribute("session.eng3p1") == null){%>
<td> <input type="text" name="session.eng3p1" value = ""></td>
<td> <input type="text" name="session.eng3p2" value = ""></td>
<%} else { %>
        <td> <input type="text" name="session.eng3p1" value = <%= session.getAttribute("session.eng3p1") %>></td>
        <td><input type="text" name="session.eng3p2" value = <%= session.getAttribute("session.eng3p2") %>></td>
        <%} %>
    </tr>
    
    <tr>
    

      <td>Quarta</td>
      <td>Estrutura de Dados</td>
       <%if(session.getAttribute("session.edp1") == null){%>
<td> <input type="text" name="session.edp1" value = ""></td>
<td> <input type="text" name="session.edp2" value = ""></td>
<%} else { %>
       <td><input type="text" name="session.edp1" value = <%= session.getAttribute("session.edp1") %>></td>
       <td><input type="text" name="session.edp2" value = <%= session.getAttribute("session.edp2") %>></td>
          <%} %>
    </tr>
    
    <tr>
    

      <td>Quinta</td>
      <td>Engenharia de Software 2</td>
       <%if(session.getAttribute("session.eng2p1") == null){%>
<td> <input type="text" name="session.eng2p1" value = ""></td>
<td> <input type="text" name="session.eng2p2" value = ""></td>
<%} else { %>
      <td><input type="text" name="session.eng2p1" value = <%= session.getAttribute("session.eng2p1") %>></td>
      <td><input type="text" name="session.eng2p2" value = <%= session.getAttribute("session.eng2p2") %>></td>
        <%} %>
    </tr>
  
    
    <tr>
    

      <td>Sexta</td>
      <td>Segurança da Informação</td>
       <%if(session.getAttribute("session.sip1") == null){%>
<td> <input type="text" name="session.sip1" value = ""></td>
<td> <input type="text" name="session.sip2" value = ""></td>
<%} else { %>
        <td><input type="text" name="session.sip1" value = <%= session.getAttribute("session.sip1") %>></td>
           <td><input type="text" name="session.sip2" value = <%= session.getAttribute("session.sip2") %>></td>
        <%} %>
    </tr>
    
    <tr>
    

      <td>Sábado</td>
      <td>Banco de Dados</td>
       <%if(session.getAttribute("session.bdp1") == null){%>
<td> <input type="text" name="session.bdp1" value = ""></td>
<td> <input type="text" name="session.bdp2" value = ""></td>
<%} else { %>
          <td><input type="text" name="session.bdp1" value = <%= session.getAttribute("session.bdp1") %>></td>
         <td><input type="text" name="session.bdp2" value = <%= session.getAttribute("session.bdp2") %>></td>
       <%} %>
    </tr>
    
    
    
    
    
    
    </tbody>

    
    </table>
    
    
     <input type="submit" name="session.atualiza" value="Atualizar"/>
    
     </form>
    
    
    
    
    
    
<%}%>
 
 
 


</body>
</html>