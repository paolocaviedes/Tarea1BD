<%-- 
    Document   : index
    Created on : 16-04-2014, 10:56:49 PM
    Author     : Paolo
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
   <head>
   
       <link rel="stylesheet" type="text/css" href="CSS.css"> 
<style type="text/css"> 
body {
color: blueviolet; 
background-image: url(fondo15.jpg);
 } 
</style> 
<script type="text/javascript">
function validarForm(formulario) {
  if(formulario.l_nombre.value.length===0) { //¿Tiene 0 caracteres?
    formulario.l_nombre.focus();    // Damos el foco al control
    alert('No has escrito tu Usuario'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
   if(formulario.l_clave.value.length===0) { //¿Tiene 0 caracteres?
    formulario.l_clave.focus();    // Damos el foco al control
    alert('No has escrito la Contraseña '); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
   
  return true; //Si ha llegado hasta aquí, es que todo es correcto
}
</script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pepe´s works</title>
    </head>
    <body >
        <form action="validar.jsp" method="post" onsubmit="return validarForm(this);">
            <table BORDER="black" align="right">
                <tr><td>Usuario</td><td><input type="text" name="l_nombre"></td></tr>
                <tr><td>Contraseña</td><td><input type="password" name="l_clave"></td></tr>
                
                <tr><td><input type="submit" name="Entrar" value="Entrar"/></td></tr>
                
            </table>
        </form>
   
        <h1>Pepe´s Works</h1>
    
    
    </body>
    
</html>
