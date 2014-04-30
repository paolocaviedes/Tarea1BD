<%-- 
    Document   : Editar_productos_adm
    Created on : 18-04-2014, 05:09:58 AM
    Author     : Paolo
--%>
<%@page import="javax.swing.JOptionPane"%>
<!-- Los import -->
<%@ page language="java" import="java.sql.*"
         import = "java.sql.Connection"
         import = "java.sql.DriverManager"
         import = "java.sql.ResultSet"
         import = "oracle.jdbc.driver.*" 
         import = "java.sql.Statement"
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Productos</title>
    </head>
    <body>
        <h1>Editar productos</h1>
    </body>
</html>
<form method="post" action="editarproducto.jsp">
<select name="id_producto" >
                producto:<%
                    int id1=8000;
                    String driver = "oracle.jdbc.OracleDriver";
                    String url = "jdbc:oracle:thin:@Paolo-PB:1521:XE";
                    String username = "system";
                    String password = "bd";
                    Class.forName(driver);
                    Connection conn = DriverManager.getConnection(url,username,password);
                    Statement stm = conn.createStatement();
                    String sql = "select * from bd.producto";
 
                    ResultSet ciclo = stm.executeQuery(sql);
                    %>
                    <option value="<%out.print(id1);%>">Codigo - Nombre - Cantidad</option>
                       <%
                    while (ciclo.next()){
                        String nombre = ciclo.getString("nombre");
                        int stock= ciclo.getInt("stock");
                        int id = ciclo.getInt("id_producto");
                        out.println("<option value="+id+">"+id+" - "+nombre+" - "+stock+"</option>");  
                    }
                    
                    %>
                    </select>
                    <input type="submit" value="Aceptar">
                    
</form>                  
<form meth2od="post" action="editarproducto_find.jsp">
    <pre>
       Buscar:<input type="text" name="nombre" value="Ingrese su busqueda">
       
                    
    </pre>
    <input  type="submit" value="Buscar" >
</form>



<%
        
       //String usuario = (String)Session.getAttribute("nombre");
       HttpSession sesion=request.getSession();
       String usuario = (String)sesion.getAttribute("nombre");

       sesion.setAttribute("nombre",usuario);
       out.print("<p>"+usuario+", Administrador</p>");
      
        

%>



