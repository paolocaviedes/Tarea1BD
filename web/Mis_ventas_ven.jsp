<%-- 
    Document   : Mis_ventas_ven
    Created on : 18-04-2014, 01:17:31 AM
    Author     : Paolo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="javax.swing.JOptionPane"%>
<!-- Los import -->
<%@ page language="java" import="java.sql.*"
         import = "java.sql.Connection"
         import = "java.sql.DriverManager"
         import = "java.sql.ResultSet"
         import = "oracle.jdbc.driver.*" 
         import = "java.sql.Statement"
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Mis Ventas</h1>
    </body>
</html>

<style type="text/css"> 
table, th, td {

border:1px solid black;
border-collapse:collapse;
}
th,td
{
padding:5px;
} 
</style> 

<%
   try{
       HttpSession sesion=request.getSession();
       String usuario = (String)sesion.getAttribute("nombre");

       sesion.setAttribute("nombre",usuario);
       
      
       String driver = "oracle.jdbc.OracleDriver";
       String url = "jdbc:oracle:thin:@localhost:1521:XE";
       String username = "system";
       String password = "bd";
       Class.forName(driver);
       Connection conn = DriverManager.getConnection(url,username,password);
       Statement stm = conn.createStatement();
                    
       String rutv = "";
       String sql1 = "select RUT from BD.USUARIO where bd.usuario.nombre='"+usuario+"'";
            
       ResultSet datosventa = stm.executeQuery(sql1);
       
       while (datosventa.next()){
            rutv = datosventa.getString("rut");

            out.print(rutv);
            out.println();           
       }
       out.print("<br/>");
       out.print("<br/>");
       
       
       String sql2 = "select * from BD.VENTA inner join BD.DETALLE_VENTA on VENTA.ID_VENTA = DETALLE_VENTA.ID_VENTA inner join BD.PRODUCTO on DETALLE_VENTA.ID_PRODUCTO = PRODUCTO.ID_PRODUCTO where id_usuario = '"+rutv+"'";
       
       
       ResultSet ventas = stm.executeQuery(sql2);
       
              out.print("<table>");
       out.print("<tr>"
               + "<th>ID VENTA</td>"
               + "<th>NOMBRE</td>"
               + "<th>CLIENTE</td>"
               + "<th>CANTIDAD</td>"
               + "</tr>");
       
              while (ventas.next()){
                  
           int IDVEN = ventas.getInt("ID_VENTA");
           String NOMBRE = ventas.getString("NOMBRE");
           String CLIENTE = ventas.getString("ID_CLIENTE");
           int CANTI = ventas.getInt("CANTIDAD");
 
            out.print("<tr>");
            out.print("<td>"+IDVEN+"</td>");
            out.print("<td>"+NOMBRE+"</td>");
            out.print("<td>"+CLIENTE+"</td>");
            out.print("<td>"+CANTI+"</td>");
            out.print("<tr>");
       }
       
       
       
              out.print("<p>"+usuario+", Vendedor</p>");
       
            } catch (SQLException error2) {
                out.println("Error SQL" + error2.getMessage());
            } catch (Exception error3) {
                out.println("Se ha producido una excepción try " + error3.getMessage());
            } 
    
%>
