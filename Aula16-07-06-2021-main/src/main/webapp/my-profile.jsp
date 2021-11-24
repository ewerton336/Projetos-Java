
<%@page import="java.util.ArrayList"%>
<%@page import="db.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String requestError = null;
    try{
        if(request.getParameter("changePassword")!=null){
            String login = (String) session.getAttribute("user.login");
            String password = request.getParameter("password");
            String newPassword1 = request.getParameter("newPassword1");
            String newPassword2 = request.getParameter("newPassword2");
            if(User.getUser(login, password) == null){
                requestError = "Senha inválida";
            }else if(!newPassword1.equals(newPassword2)){
                requestError = "Confirmação de nova senha inválida";
            }else{
                User.changePassword(login, newPassword1);
                response.sendRedirect(request.getRequestURI());
            }
        }
    }catch(Exception ex){
        requestError = ex.getMessage();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Meu Perfil - MyFinance$</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h2>Meu Perfil</h2>
        
        <%if(session.getAttribute("user.login") == null){%>
            <div>Página restrita a usuários logados</div>
        <%}else{%>
        
        <h3>Login</h3>
        <div><%= session.getAttribute("user.login") %></div>
        <h3>Nome</h3>
        <div><%= session.getAttribute("user.name") %></div>
        <h3>Papel</h3>
        <div><%= session.getAttribute("user.role") %></div>
        <fieldset>
            <legend>Alterar senha</legend>
            <form method="post">
                <%if(requestError!=null){%>
                    <div style="color: red"><%= requestError %></div>
                <%}%>
                Senha: 
                <br/><input type="password" name="password"/>
                <br/>Nova senha:
                <br/><input type="password" name="newPassword1"/>
                <br/>Confirmeação da nova senha:
                <br/><input type="password" name="newPassword2"/>
                <hr/>
                <input type="submit" name="changePassword" value="Alterar senha"/>
            </form>
        </fieldset>
        
        <%}%>
    </body>
</html>
