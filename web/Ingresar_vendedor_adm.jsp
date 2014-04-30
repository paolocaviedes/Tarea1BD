<%-- 
    Document   : Ingresar_vendendor_adm
    Created on : 18-04-2014, 12:28:38 AM
    Author     : Paolo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
        
<%
        
       //String usuario = (String)Session.getAttribute("nombre");
       HttpSession sesion=request.getSession();
       String usuario = (String)sesion.getAttribute("nombre");

       sesion.setAttribute("nombre",usuario);
       out.print("<p>"+usuario+", Administrador</p>");
      
        

%>
 
<style type="text/css">
    html { 
color: black; 
background-image: url(fondo16.jpg);
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
<script type="text/javascript">
function validarForm(formulario) {
  if(formulario.rut.value.length===0) { //¿Tiene 0 caracteres?
    formulario.rut.focus();    // Damos el foco al control
    alert('No has escrito el rut'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
   if(formulario.pass.value.length===0) { //¿Tiene 0 caracteres?
    formulario.pass.focus();    // Damos el foco al control
    alert('No has escrito la contraseña'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
   if(formulario.pass2.value.length===0) { //¿Tiene 0 caracteres?
    formulario.pass2.focus();    // Damos el foco al control
    alert('No has escrito la contraseña 2'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
  if(formulario.nombre.value.length===0) { //¿Tiene 0 caracteres?
    formulario.nombre.focus();    // Damos el foco al control
    alert('No has escrito el nombre'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
        clave = document.f1.pass.value; 
   	clave2 = document.f1.pass2.value; 

   if (clave !== clave2) {
      alert('Las contraseñas no coinciden'); //Mostramos el mensaje
      return false; //devolvemos el foco
  }
   	

  return true; //Si ha llegado hasta aquí, es que todo es correcto
}
</script>
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar Vendedor</title>
    </head>
    <body>
       <form action="accionagregarvendedor.jsp" method="post" onsubmit="return validarForm(this);"name="f1">
        <table BORDER="WHITE" align="center" border="1" vertical-align="middle">
            
            <tbody>
                <h1>Rellene los campos</h1>
                <tr>
                    <td >Ingrese Rut</td>
                    <td><input type="text" name="rut" value="" /></td>
                </tr>
                <tr>
                    <td>Ingrese Contraseña</td>
                    <td><input type="password" name="pass" value=""  /></td>
                </tr>
                <tr>
                    <td>Repita Contraseña</td>
                    <td><input type="password" name="pass2" value=""  /></td>
                </tr>
                <tr>
                    <td>Ingrese Nombre</td>
                    <td><input type="text" name="nombre" value=""  /></td>
                </tr>
                    <td><input type="submit" name="Agregar" value="Agregar"/></td>
                </tr>
            </tbody>
        </table>
        </form>
        
        <form  action="Menu_administrador.jsp" method="post">
            <table align="center">
            <tr><td ><input class="botonsalir" type="Submit" value="Volver" name="Cerrar Sesion"/></td></tr>
            </table>
        </form>
    </body>
</html>