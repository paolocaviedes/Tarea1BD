<%-- 
    Document   : editarproducto_find
    Created on : 18-04-2014, 08:05:18 AM
    Author     : Paolo
--%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*" session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Pulento</h1>
    </body>
</html>

<%
       
       String driver = "oracle.jdbc.OracleDriver";
       String url = "jdbc:oracle:thin:@localhost:1521:XE";
       String username = "system";
       String password = "bd";
       Class.forName(driver);
       Connection conn = DriverManager.getConnection(url,username,password);
       Statement stm = conn.createStatement();
                    
       String nombre= request.getParameter("nombre");
       String sql1 = "select * from bd.producto where nombre='"+nombre+"'";
       
       try{
               
         ResultSet datosproducto = stm.executeQuery(sql1);
         datosproducto.next();
       
       String codigo = datosproducto.getString("id_producto");
       String stock = datosproducto.getString("stock");
       String descripcion= datosproducto.getString("descripcion"); 
       String categoria= datosproducto.getString("categoria");
       String precio= datosproducto.getString("precio");
       
       session.setAttribute("product_name", nombre);
       
       //out.print(codigo);
       //out.print(stock);
      %>
         <form method="post" action="accioneditarproducto.jsp">
            <pre>
                Codigo:<% out.println(codigo); %>
                Nombre: <% out.println(nombre); %>
                Stock: <% out.println(stock); %>
                Descripcion : <input type="text" name="descripcion" value= "<%out.print(descripcion);%>">
                Categoria : <input type="text" name="categoria" value= "<%out.print(categoria);%>">
                Precio : <input type="text" name="precio" value="<%out.print(precio);%>" > 
                               
            </pre>
            <input type="submit" value="Editar"> 
       </form>
         
      <%
      }
   catch(Exception e){
        JOptionPane.showMessageDialog(null,"Producto no encontrado o no ingresado","Error",JOptionPane.ERROR_MESSAGE);
	e.printStackTrace();
        
        %>    <script languaje="JavaScript"> 
         location.href='Editar_productos_adm.jsp'; 
         </script>
         <%      
   
   
   }
   %>

    </body>
</html>