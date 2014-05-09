<%-- 
    Document   : accionagregarproducto
    Created on : 18-04-2014, 05:46:46 AM
    Author     : Paolo
--%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import = "java.sql.*" %>
<%@page import = "oracle.jdbc.driver.*" %>
<%@page contentType="text/html" %>
 
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <body>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <h1>accionagregarproducto</h1>
    </head>
        
        <%
                   
            String code = request.getParameter("product_code");
            String nombre = request.getParameter("nombre");
            String desc = request.getParameter("descripcion");
            String categoria = request.getParameter("categoria");
            String cantidad = request.getParameter("cantidad");
            String precio = request.getParameter("precio");
            
           
            
            String sql = "insert into bd.Producto(id_producto,stock,descripcion,categoria,precio,nombre) values('"+code+"','"+cantidad+"','"+desc+"','"+categoria+"','"+precio+"','"+nombre+"')";
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String username = "system";
            String password = "bd";
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url,username,password);
            Statement stm = conn.createStatement();
            
           
   try{
               
        stm.executeUpdate(sql);
      %>
         <script language="JavaScript">
          alert("Producto agregado con exito");
          location.href="Menu_administrador.jsp";
         </script>
      <%
      }
   catch(Exception e){
        JOptionPane.showMessageDialog(null,"Falta información","Error",JOptionPane.ERROR_MESSAGE);
	e.printStackTrace();
      }
      %>
         <script languaje="JavaScript"> 
         location.href='Agregar_productos_adm.jsp'; 
         </script>              
    </body>
</html>