<%@page import="java.util.ArrayList"%>
<%@page import="db.Disciplinas"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
    String requestError = null;
    ArrayList<Disciplinas> list = new ArrayList<>();
    try{
        if(request.getParameter("Inserir")!=null){
            String name = request.getParameter("name");
            String diasemana = request.getParameter("diasemana");
            String horario = request.getParameter("horario");
            String qtdaulas = request.getParameter("qtdaulas");
            Disciplinas.insert(name, diasemana, horario, qtdaulas);
            response.sendRedirect(request.getRequestURI());
        }else if(request.getParameter("delete")!=null){
            String name = request.getParameter("name");
            Disciplinas.delete(name);
            response.sendRedirect(request.getRequestURI());
        }else if(request.getParameter("nota")!=null){
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Disciplinas - SigaCopy</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h2>Disciplinas</h2>
        <%if(requestError!=null){%>
        <div style="color: red"><%= requestError %></div>
        <%}%>
        
        <%if(session.getAttribute("user.login") == null){%>
            <div>Página restrita a usuários logados</div>
        <%}else{%>
        
        <form method="post">
            Nome da disciplina: <input type="text" name="name"/>
             Dia da semana:  <select name="diasemana">
             <option value="Segunda">Segunda-Feira</option>
                 <option value="Terca">Terça-Feira</option>
                     <option value="Quarta">Quarta-Feira</option>
                         <option value="Quinta">Quinta-Feira</option>
                             <option value="Sexta">Sexta-Feira</option>
                                 <option value="Sabado">Sábado</option>
              		</select>
             
           
              Horário: <input type="time" name="horario"/>
               Quantidade de Aulas: <input type="number" name="qtdaulas"/>
            <input type="submit" name="Inserir" value="Inserir"/>
        </form>
        <hr/>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Dia da Semana</th>
                <th>Horario</th>
                <th>Quantidade de aulas</th>
                   <th>p1</th>
                      <th>p2</th>
                <th>Exclusão</th>
            </tr>
            <%for(Disciplinas d: list){%>
                <tr>
                    <td><%= d.getName() %></td>
                    <td><%= d.getDiaSemana() %></td>
                     <td><%= d.getHorario() %></td>
                     <td><%= d.getAulas() %></td>
                     <%if (d.getP1()!= null) { %>
                      <td><%= d.getP1() %></td>
                       <td><%= d.getP2() %></td>
                       <%} else { %>
                    	   <td></td>
                    	      <td></td>
                       <%}  %>
                     
                    <td>
                        <form method="post">
                        	
                            <input type="hidden" name="name" value="<%= d.getName() %>"/>
                            <input type="submit" name="delete" value="Excluir"/>
                        </form>
                    </td>
                </tr>
            <%}%>
        </table>
        
        
       <br><br>
       
       <h1> Atualizar Notas</h1>
        
        <table border="1">
            <tr>
                <th>Materia</th>
                <th>p1</th>
                <th>p2</th>
            </tr>
            <%for(Disciplinas d: list){%>
              
                <tr>
                <form method="post">
                    <td><%= d.getName() %></td>
                    <td><input type="number" name="p1" value="<%= d.getP1() %>"></td>
                    <td> <input type="number" name="p2" value="<%= d.getP2() %>"></td>
                    <td>
                      
                        	
                            <input type="hidden" name="name" value="<%= d.getName() %>"/>
                            <input type="submit" name="nota" value="Savar nota"/>
                    </td>
                </tr>
                 </form>
            <%}%>
        </table>
        
        <%}%>
    </body>
</html>