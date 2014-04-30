<%-- 
    Document   : Ver_ventas_a_clientes_adm
    Created on : 18-04-2014, 12:36:18 AM
    Author     : Paolo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Ver ventas a clientes</h1>
    </body>
</html>
        
<%
        
       //String usuario = (String)Session.getAttribute("nombre");
       HttpSession sesion=request.getSession();
       String usuario = (String)sesion.getAttribute("nombre");

       sesion.setAttribute("nombre",usuario);
       out.print("<p>"+usuario+"</p>");
      
        

%>
