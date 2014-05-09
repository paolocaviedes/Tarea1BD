<%-- 
    Document   : accionsiguientecompra
    Created on : 21-04-2014, 06:39:25 PM
    Author     : Paolo
--%>

<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.Connection"%>
<%@page import = "java.sql.*" %>
<%@page import = "oracle.jdbc.driver.*" %>
<%@page contentType="text/html" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String idproducto = request.getParameter("id_producto");
            int idproduct = Integer.parseInt(idproducto);
            //String fecha = request.getParameter("fecha");
            //String hora = request.getParameter("hora");
            
            HttpSession sesion = request.getSession();
            
            int totalparcial = (Integer)sesion.getAttribute("totalparcial");
            
            String cantidad = request.getParameter("cantidad");
            int int_cantidad = Integer.parseInt(cantidad);
            String preciounitario = request.getParameter("preciounitario");
            int price = Integer.parseInt(preciounitario);
            
            
            int totalcompra= price*int_cantidad;
            int totalparcialactualizado= totalparcial+totalcompra;
            sesion.setAttribute("totalparcial",totalparcialactualizado);
            sesion.setAttribute("id_producto",idproducto);
            
            
            
                                                     
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String username = "system";
            String password = "bd";
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url,username,password);
            Statement stm = conn.createStatement();
            Statement stm2 = conn.createStatement();
         
            String sql = "select MAX(id_compra) from bd.compra";
            ResultSet idcompra = stm.executeQuery(sql);
            idcompra.next();
            int id_compra = idcompra.getInt("max(id_compra)");  
            String sql2 = "insert into bd.detalle_compra(id_compra, id_producto,cantidad,precio) values("+id_compra+","+idproducto+","+int_cantidad+","+price+")";
            
            stm2.executeQuery(sql2);
            %><script language="JavaScript">
                    alert("Producto comprado con exito");
                    location.href="Ingresar_siguientecompra_adm.jsp";
                                </script>
            %>
    </body>
</html>
