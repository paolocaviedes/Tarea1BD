<%-- 
    Document   : accionfinalizarcompra
    Created on : 21-04-2014, 06:49:41 PM
    Author     : Paolo
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import = "java.sql.*" %>
<%@page import = "oracle.jdbc.driver.*" %>
<%@page contentType="text/html" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%    
            HttpSession sesion = request.getSession();
            String idproduct= (String)sesion.getAttribute("id_producto");
            //String idproducto = request.getParameter("id_producto");
            int idproducto = Integer.parseInt(idproduct);
         

            
            int totalparcial = (Integer)sesion.getAttribute("totalparcial");
            
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@Paolo-PB:1521:XE";
            String username = "system";
            String password = "bd";
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url,username,password);
            Statement stm = conn.createStatement();
            Statement stm2 = conn.createStatement();
            
            String sql = "select MAX(id_compra) from bd.compra";
            //String sql2 = "select sum(precio) from detalle_compra";
            
            ResultSet max_id_compra = stm.executeQuery(sql);
            max_id_compra.next();
            int id_compra = max_id_compra.getInt("max(id_compra)");

            String sql2 = "update bd.compra set monto_total="+totalparcial+" where id_compra = "+id_compra;
            
            stm2.executeQuery(sql2);

            %><script language="JavaScript">
                    alert("Compra realizada con exito");
                    location.href="Menu_administrador.jsp";
                                </script>
            %>
    </body>
</html>
