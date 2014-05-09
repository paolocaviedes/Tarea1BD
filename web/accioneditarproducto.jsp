<%-- 
    Document   : accioneditarproducto
    Created on : 18-04-2014, 05:39:11 PM
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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <h1>accion editar producto</h1
          
        <%

        
       //String usuario = (String)Session.getAttribute("nombre");
       HttpSession sesion=request.getSession();
       String usuario = (String)sesion.getAttribute("nombre");
       String nombre= (String)sesion.getAttribute("product_name");
       //sesion.setAttribute("nombre",usuario);
       out.print("<p>"+usuario+", Administrador</p>");
      out.print("<p>"+nombre+"</p>");
        


                   
            
            String desc = request.getParameter("descripcion");
            String cat = request.getParameter("categoria");
            String price = request.getParameter("precio");
           
            
            String sql = "update bd.producto set descripcion ='"+desc+"' where nombre='"+nombre+"'";
            String sql1 = "update bd.producto set categoria ='"+cat+"' where nombre='"+nombre+"'";
            String sql2 = "update bd.producto set precio ='"+price+"' where nombre='"+nombre+"'";
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String username = "system";
            String password = "bd";
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url,username,password);
            Statement stm = conn.createStatement();
            
          // stm.executeUpdate(sql);
   try{
               
        stm.executeUpdate(sql);
        stm.executeUpdate(sql1);
        stm.executeUpdate(sql2);
      %>
         <script language="JavaScript">
          alert("Producto editado con exito");
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
         location.href='Editar_productos_adm.jsp'; 
         </script>              
    </body>
</html>