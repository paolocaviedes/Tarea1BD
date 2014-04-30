<%-- 
    Document   : Agregar_productos_adm
    Created on : 18-04-2014, 05:09:40 AM
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
  if(formulario.product_code.value.length===0) { //¿Tiene 0 caracteres?
    formulario.product_code.focus();    // Damos el foco al control
    alert('No has escrito el codigo del producto'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
   if(formulario.nombre.value.length===0) { //¿Tiene 0 caracteres?
    formulario.nombre.focus();    // Damos el foco al control
    alert('No has escrito el nombre'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
   if(formulario.descripcion.value.length===0) { //¿Tiene 0 caracteres?
    formulario.descripcion.focus();    // Damos el foco al control
    alert('No has escrito la descripcion'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
  if(formulario.categoria.value.length===0) { //¿Tiene 0 caracteres?
    formulario.categoria.focus();    // Damos el foco al control
    alert('No has escrito la categoria'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
  
    if(formulario.cantidad.value.length===0) { //¿Tiene 0 caracteres?
    formulario.cantidad.focus();    // Damos el foco al control
    alert('No has escrito la cantidad'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
  if(formulario.precio.value.length===0) { //¿Tiene 0 caracteres?
    formulario.precio.focus();    // Damos el foco al control
    alert('No has escrito el precio'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }



  return true; //Si ha llegado hasta aquí, es que todo es correcto
}
</script>
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Producto</title>
         <h1>Agregar Producto</h1>
    </head>
    <body>
       <form action="accionagregarproducto.jsp" method="post" onsubmit="return validarForm(this);">
        <table BORDER="WHITE" align="center" border="1" vertical-align="middle">
            
            <tbody>
                <h1>Rellene los campos</h1>
                <tr>
                    <td >Ingrese Codigo del producto</td>
                    <td><input type="text" name="product_code" value="" /></td>
                </tr>
                <tr>
                    <td>Ingrese Nombre</td>
                    <td><input type="text" name="nombre" value=""  /></td>
                </tr>
                <tr>
                    <td>Ingrese Descripcion</td>
                    <td><input type="text" name="descripcion" value=""  /></td>
                </tr>
                <tr>
                    <td>Ingrese Categoria</td>
                    <td><input type="text" name="categoria" value=""  /></td>
                </tr>
                <tr>
                    <td>Ingrese Cantidad</td>
                    <td><input type="text" name="cantidad" value=""  /></td>
                </tr>
                <tr>
                    <td>Ingrese Precio</td>
                    <td><input type="text" name="precio" value=""  /></td>
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