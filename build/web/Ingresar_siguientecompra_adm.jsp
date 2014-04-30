<%-- 
    Document   : Ingresar_siguientecompra_adm
    Created on : 19-04-2014, 03:41:06 AM
    Author     : Paolo
--%>
<%@page import="javax.swing.JOptionPane"%>
<!-- Los import -->
<%@ page language="java" import="java.sql.*"
         import = "java.sql.Connection"
         import = "java.sql.DriverManager"
         import = "java.sql.ResultSet"
         import = "oracle.jdbc.driver.*" 
         import = "java.sql.Statement"
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
       HttpSession sesion=request.getSession();
       Integer totalparcial = (Integer)sesion.getAttribute("totalparcial");
        String usuario = (String)sesion.getAttribute("nombre");
      //int totalp = Integer.parseInt(totalparcial);
       
       out.print(totalparcial);
       out.print(usuario);
%>

<script type="text/javascript">
    /**
     * Funcion que se ejecuta cada vez que se añade una letra en un cuadro de texto
     * Suma los valores de los cuadros de texto
     */
    function sumar()
    {
        var valor1="cantidad";
        var valor2="preciounitario";

        // realizamos la suma de los valores y los ponemos en la casilla del
        // formulario que contiene el total
        document.totalitem.value=parseInt(valor1)+parseInt(valor2);
    }
 </script>  
 
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Ingresar Compra</h1>

        

<script type="text/javascript">
function validarForm(formulario) {
  if(formulario.fecha.value.length===0) { //¿Tiene 0 caracteres?
    formulario.fecha.focus();    // Damos el foco al control
    alert('No has escrito la fecha'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
    if(formulario.hora.value.length===0) { //¿Tiene 0 caracteres?
    formulario.hora.focus();    // Damos el foco al control
    alert('No has escrito la hora'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
    if(formulario.cantidad.value.length===0) { //¿Tiene 0 caracteres?
    formulario.cantidad.focus();    // Damos el foco al control
    alert('No has escrito la cantidad'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
    if(formulario.preciounitario.value.length===0) { //¿Tiene 0 caracteres?
    formulario.preciounitario.focus();    // Damos el foco al control
    alert('No has escrito el precio'); //Mostramos el mensaje
    return false; //devolvemos el foco
  }
   
  return true; //Si ha llegado hasta aquí, es que todo es correcto
}
</script>


    

<form method="post" action="accionsiguientecompra.jsp" onsubmit="return validarForm(this);">
<select name="id_producto" >
                producto:<%
                    int id1=8000;
                    String driver = "oracle.jdbc.OracleDriver";
                    String url = "jdbc:oracle:thin:@Paolo-PB:1521:XE";
                    String username = "system";
                    String password = "bd";
                    Class.forName(driver);
                    Connection conn = DriverManager.getConnection(url,username,password);
                    Statement stm = conn.createStatement();
                    String sql = "select * from bd.producto";
 
                    ResultSet ciclo = stm.executeQuery(sql);
                    %>
                    <option value="<%out.print(id1);%>">Seleccione Producto</option>
                       <%
                    while (ciclo.next()){
                        String nombre = ciclo.getString("nombre");
                        int stock= ciclo.getInt("stock");
                        int id = ciclo.getInt("id_producto");
                        out.println("<option value="+id+">"+nombre+"</option>");  
                    }
                    
                    %>
                
            
                    </select>
         
         Cantidad: <input type="text" name="cantidad">
         precio unitario: <input type="text" name="preciounitario"> 
         <input type="submit" value="Agregar">
               
</form>
<a href="accionfinalizarcompra.jsp"><input type="submit" value="Terminar" ></a>

    </body>
</html>