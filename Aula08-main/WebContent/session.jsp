<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	if(request.getParameter("name")!=null ){
		session.setAttribute("name",request.getParameter("name") );
		
	}



%>




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Session</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/bootstrap.jspf" %>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h2>Session</h2>
        
        
       
        <h2>Bem vindo, <%= session.getAttribute("name")  %></h2>
        <form>
    
        
        
        Nome: <input type='text' name="name"/>
        <input type='submit' name="set" value="Enviar"/>
        
        
        
        </form>
        
        <h1>Bem vindo!</h1>
        
        
     <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>	
</html>
