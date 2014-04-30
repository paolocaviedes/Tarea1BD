<%-- 
    Document   : accionagregarcliente
    Created on : 18-04-2014, 04:42:26 AM
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
        <title>JSP Page</title>
        <h1>accionagregarcliente</h1>
    </head>
        
        <%
                   
            String rut = request.getParameter("rut");
            String nombre = request.getParameter("nombre");
           
            
            String sql = "insert into bd.cliente(rut, nombre) values('"+rut+"','"+nombre+"')";
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
          alert("Cliente agregado con exito");
          location.href="Menu_vendedor.jsp";
         </script>
      <%
      }
   catch(Exception e){
        JOptionPane.showMessageDialog(null,"Falta información","Error",JOptionPane.ERROR_MESSAGE);
	e.printStackTrace();
      }
      %>
         <script languaje="JavaScript"> 
         location.href='Ingresar_cliente_ven.jsp'; 
         </script>              
    </body>
</html>