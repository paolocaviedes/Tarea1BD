<%-- 
    Document   : inicio_vendedor
    Created on : 17-04-2014, 01:32:22 AM
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
 #banner { height: 50px;
           width: 1200px;
           font-size: 12px; 
           font-family: "Verdana";
           padding: 15px;
           background-color: grey;
 }
 
 .classname {
	-moz-box-shadow:inset 0px 1px 17px 1px #caefab;
	-webkit-box-shadow:inset 0px 1px 17px 1px #caefab;
	box-shadow:inset 0px 1px 17px 1px #caefab;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #77d42a), color-stop(1, #5cb811) );
	background:-moz-linear-gradient( center top, #77d42a 5%, #5cb811 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#77d42a', endColorstr='#5cb811');
	background-color:#77d42a;
	-webkit-border-top-left-radius:40px;
	-moz-border-radius-topleft:40px;
	border-top-left-radius:40px;
	-webkit-border-top-right-radius:40px;
	-moz-border-radius-topright:40px;
	border-top-right-radius:40px;
	-webkit-border-bottom-right-radius:40px;
	-moz-border-radius-bottomright:40px;
	border-bottom-right-radius:40px;
	-webkit-border-bottom-left-radius:40px;
	-moz-border-radius-bottomleft:40px;
	border-bottom-left-radius:40px;
	text-indent:0px;
	border:1px solid #268a16;
	display:inline-block;
	color:#306108;
	font-family:Arial;
	font-size:14px;
	font-weight:bold;
	font-style:normal;
	height:37px;
	line-height:37px;
	width:190px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 2px #aade7c;
}
.classname:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #5cb811), color-stop(1, #77d42a) );
	background:-moz-linear-gradient( center top, #5cb811 5%, #77d42a 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#5cb811', endColorstr='#77d42a');
	background-color:#5cb811;
}.classname:active {
	position:relative;
	top:1px;
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
    <div id="banner">
     <%
        
       //String usuario = (String)Session.getAttribute("nombre");
       HttpSession sesion=request.getSession();
       String usuario = (String)sesion.getAttribute("nombre");

       sesion.setAttribute("nombre",usuario);
       out.print("<p>"+usuario+", Vendedor</p>");
      
        

%>   
        
        
    </div>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Administrador</title>
        
    </head>
    <body>
        


        
        <p  align="center"><a align="center" href="Ingresar_cliente_ven.jsp"><button class="classname">Ingresar Cliente</button></a></p>
        <p  align="center"><a align="center" href="Ingresar_venta_ven.jsp"><button class="boton">Ingresar Venta</button></a></p>
        <p  align="center"><a align="center" href="index.jsp"><button class="boton">Ver ventas a Cliente</button></a></p>
        <p  align="center"><a align="center" href="Mis_ventas_ven.jsp"><button class="boton">Mis ventas</button></a></p>
       <form  action="index.jsp" method="post">
            <table align="center">
            <tr><td ><input class="botonsalir" type="Submit" value="Volver" name="Cerrar Sesion"/></td></tr>
            </table>
        </form>

    </body>
</html>