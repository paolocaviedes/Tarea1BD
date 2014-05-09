<%-- 
    Document   : Ver_ventas_a_clientes_adm
    Created on : 18-04-2014, 12:36:18 AM
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
        <h1>Ver ventas a clientes</h1>
    </body>
</html>
       


<form method="post" action="ACCIONVERVENTAS.jsp">
<select name="rut" >
                producto:<%
                    int id1=8000;
                    String driver = "oracle.jdbc.OracleDriver";
                    String url = "jdbc:oracle:thin:@localhost:1521:XE";
                    String username = "system";
                    String password = "bd";
                    Class.forName(driver);
                    Connection conn = DriverManager.getConnection(url,username,password);
                    Statement stm = conn.createStatement();
                    String sql = "select * from bd.cliente";
 
                    ResultSet ciclo = stm.executeQuery(sql);
                    %>
                    <option value="<%out.print(id1);%>">RUT - NOMBRE</option>
                       <%
                    while (ciclo.next()){
                        String rut = ciclo.getString("rut");
                        String nombre = ciclo.getString("nombre");
                        out.println("<option value="+rut+">"+rut+" - "+nombre+"</option>");  
                    }
                    
                    %>
                    </select>
                    <input type="submit" value="Ver">
                    
</form>       
                    
<%
        
       //String usuario = (String)Session.getAttribute("nombre");
       HttpSession sesion=request.getSession();
       String usuario = (String)sesion.getAttribute("nombre");

       sesion.setAttribute("nombre",usuario);
       out.print("<p>"+usuario+", Administrador</p>");
      
        

%>

