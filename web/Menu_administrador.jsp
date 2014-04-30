<%-- 
    Document   : Menu_administrador
    Created on : 16-04-2014, 11:00:51 PM
    Author     : Paolo
--%>

<%@page import="javax.websocket.Session"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style type="text/css">
    html { 
color: black; 
background-image: url(fondo17.jpg);
 } 
  .boton{
        font-size:10px;
        font-family:Verdana,Helvetica;
        font-weight:bold;
        color:white;
        background:Black;
        border:0px;
        width:100px;
        height:50px;
       }
       .botonsalir{
        font-size:10px;
        font-family:Verdana,Helvetica;
        font-weight:bold;
        color:white;
        background:Black;
        border:0px;
        width:100px;
        height:50px;
       }
</style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Administrador</title>
        
    </head>
    <body>
        
<%
        
       //String usuario = (String)Session.getAttribute("nombre");
       HttpSession sesion=request.getSession();
       String usuario = (String)sesion.getAttribute("nombre");

       sesion.setAttribute("nombre",usuario);
       out.print("<p>"+usuario+", Administrador</p>");
      
        

%>

        <p  align="center"><a align="center" href="Ingresar_vendedor_adm.jsp"><button class="boton">Ingresar Vendedor</button></a></p>
         <p  align="center"><a align="center" href="index.jsp"><button class="boton">Ingresar Cliente</button></a></p>
        <p  align="center"><a align="center" href="Administrar_productos_adm.jsp"><button class="boton">Administrar Productos</button></a></p>
        <p  align="center"><a align="center" href="Ingresar_compra_adm.jsp"><button class="boton">Ingresar Compra</button></a></p>
         <p  align="center"><a align="center" href="index.jsp"><button class="boton">Ingresar Venta</button></a></p>
        <p  align="center"><a align="center" href="Ver_ventas_a_clientes_adm.jsp"><button class="boton">Ver ventas a Cliente</button></a></p>
       <form  action="index.jsp" method="post">
            <table align="center">
            <tr><td ><input class="botonsalir" type="Submit" value="Volver" name="Cerrar Sesion"/></td></tr>
            </table>
        </form>

    </body>
</html>