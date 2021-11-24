<%-- 
    Document   : index
    Created on : 24 de mai. de 2021, 19:55:25
    Author     : rlarg
--%>

<%@page import="db.TasksConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page import="web.DbListener"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Exception reqException = null;
    ArrayList<String> taskList = new ArrayList<>();
    try{
        if(request.getParameter("add")!=null){
            String taskName = request.getParameter("taskName");
            TasksConnector.addTask(taskName);
            response.sendRedirect(request.getRequestURI());
        }
        if(request.getParameter("remove")!=null){
            String taskName = request.getParameter("taskName");
            TasksConnector.removeTask(taskName);
            response.sendRedirect(request.getRequestURI());
        }
        taskList = TasksConnector.getTasks();
    }catch(Exception ex){
        reqException = ex;
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tarefas Ewerton</title>
    </head>
    <body>
        <h1>Aluno: Ewerton Guimarães <br> RA: 1290482013015</h1>
        <%if(DbListener.exception != null){%>
        <div style="color:red">
            Erro na criação da base: <%= DbListener.exception.getMessage() %>
        </div>
        <hr/>
        <%}%>
        <%if(reqException != null){%>
        <div style="color:red">
            Erro no processamento da página: <%= reqException.getMessage() %>
        </div>
        <hr/>
        <%}%>
        <h2>Tarefas</h2>
        <form>
            <input type="text" name="taskName"/>
            <input type="submit" name="add" value="Adicionar tarefa"/>
        </form>
        <hr/>
        <table>
            <tr>
                <th>Nome da tarefa</th>
                <th>Exclusão</th>
            </tr>
            <%for(String taskName: taskList){%>
            <tr>
                <td><%= taskName %></td>
                <td>
                    <form>
                        <input type="hidden" name="taskName" value="<%= taskName %>"/>
                        <input type="submit" name="remove" value="Remover"/>
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
