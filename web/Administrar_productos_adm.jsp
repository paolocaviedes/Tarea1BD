<%-- 
    Document   : Administrar_productos_adm
    Created on : 18-04-2014, 12:30:48 AM
    Author     : Paolo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrar productos</title>
    </head>
    <body>
        <h1>Administrar productos</h1>
        <p  align="center"><a align="center" href="Agregar_productos_adm.jsp"><button class="boton">Agregar Productos</button></a></p>
        <p  align="center"><a align="center" href="Editar_productos_adm.jsp"><button class="boton">Editar Productos</button></a></p>
        <form  action="index.jsp" method="post">
            <table align="center">
            <tr><td ><input class="botonsalir" type="Submit" value="Volver" name="Cerrar Sesion"/></td></tr>
            </table>
        </form>
    </body>
</html>
        
<%
        
       //String usuario = (String)Session.getAttribute("nombre");
       HttpSession sesion=request.getSession();
       String usuario = (String)sesion.getAttribute("nombre");

       sesion.setAttribute("nombre",usuario);
       out.print("<p>"+usuario+", Administrador</p>");
      
        

%>

  