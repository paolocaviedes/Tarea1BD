<%-- 
    Document   : accionagregarvendedor
    Created on : 18-04-2014, 02:51:49 AM
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
        <h1>accionagregarvendedor</h1>
    </head>
        
        <%
                   
            String rut = request.getParameter("rut");
            String password1 = request.getParameter("pass");
            String nombre = request.getParameter("nombre");
            String tipo = "Vendedor";
           
            
            String sql = "insert into bd.usuario(rut, contraseña,nombre,tipo) values('"+rut+"','"+password1+"','"+nombre+"','"+tipo+"')";
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@Paolo-PB:1521:XE";
            String username = "system";
            String password = "bd";
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url,username,password);
            Statement stm = conn.createStatement();
            
           
   try{
               
        stm.executeUpdate(sql);
      %>
         <script language="JavaScript">
          alert("Vendedor agregado con exito");
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
         location.href='Ingresar_vendedor_adm.jsp'; 
         </script>              
    </body>
</html>