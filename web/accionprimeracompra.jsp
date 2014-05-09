<%-- 
    Document   : accionprimeracompra
    Created on : 18-04-2014, 10:21:55 PM
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
    </head>
    <body>
<%  
       HttpSession sesion=request.getSession();
       String usuario = (String)sesion.getAttribute("nombre");

       //sesion.setAttribute("nombre",usuario);
       String hora = request.getParameter("hora");
       String fecha = request.getParameter("fecha");
       String idproducto = request.getParameter("id_producto");
       String cantidad = request.getParameter("cantidad");
       String precio = request.getParameter("preciounitario");
       
       int cant = Integer.parseInt(cantidad);
       int price = Integer.parseInt(precio);
       int totalp= cant*price;
       
      sesion.setAttribute("totalparcial",totalp);
      
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String username = "system";
            String password = "bd";
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url,username,password);
            Statement stm = conn.createStatement();
            Statement stm2 = conn.createStatement();
            Statement stm3 = conn.createStatement();
            Statement stm4 = conn.createStatement();
  
                       
            
           
            
try{
            //Se inserta en compra para generar un id, que contendra un grupo de detalle_compra
            String sql = "insert into bd.compra(fecha,hora) values('"+fecha+"','"+hora+"')";
            stm.executeQuery(sql);
            //recuperar el producto a comprar, desde la tabla producto
            String sql2 = "select * from bd.producto where id_producto='"+idproducto+"'";
            ResultSet producto = stm2.executeQuery(sql2);
            producto.next();
            //recuperar el ultimo id compra, correspondiente a la ultima compra realizada
            String sql3 = "select MAX(id_compra) from bd.compra";
            ResultSet ultimacompra = stm3.executeQuery(sql3);
            ultimacompra.next();
            //se obtiene el ultimo id compra, y se guarda en id_compra
            int id_compra = ultimacompra.getInt("max(id_compra)");
            //Ya con el ultimo id compra se realiza la insercion en detalle_compra
            String sql4 = "insert into bd.detalle_compra(id_compra, id_producto,cantidad,precio) values('"+id_compra+"','"+idproducto+"','"+cantidad+"','"+price+"')";
            stm4.executeQuery(sql4);
         
            %><script language="JavaScript">
                    alert("Producto comprado con exito");
                    location.href="Ingresar_siguientecompra_adm.jsp";
                                </script>
            <% 
            
            
            }
            
   catch(Exception e){
        JOptionPane.showMessageDialog(null,"Falta información","Error",JOptionPane.ERROR_MESSAGE);
	e.printStackTrace();
      }
      %>
         <script languaje="JavaScript"> 
         location.href='Ingresar_compra_adm.jsp'; 
         </script>    
    </body>
</html>
