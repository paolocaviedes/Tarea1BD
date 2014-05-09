<%-- 
    Document   : ACCIONVERVENTAS
    Created on : 08-may-2014, 22:04:54
    Author     : Ivan
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
        <h1>Ver ventas cliente</h1>
    </body>
</html>
<%
       String rutcliente = request.getParameter("rut");
       out.print("<p>"+rutcliente+"</p>");
       
       String driver = "oracle.jdbc.OracleDriver";
       String url = "jdbc:oracle:thin:@localhost:1521:XE";
       String username = "system";
       String password = "bd";
       Class.forName(driver);
       Connection conn = DriverManager.getConnection(url,username,password);
       Statement stm = conn.createStatement();
                    

       String sql1 = "select ID_VENTA, ID_PRODUCTO, CANTIDAD  from BD.VENTA inner join BD.DETALLE_VENTA on BD.VENTA.ID_VENTA = BD.DETALLE_VENTA.ID_VENTA where BD.VENTA.ID_CLIENTE='"+rutcliente+"'";
       
       
       
       ResultSet datosventa = stm.executeQuery(sql1);
       
       while (datosventa.next()){
           int IDVEN = datosventa.getInt("ID_VENTA");
           int IDPRO = datosventa.getInt("ID_PRODUCTO");
           int CANTI = datosventa.getInt("CANTIDAD"); 

            out.print(IDVEN);
            out.print(IDPRO);
            out.print(CANTI);
                    }
  /*     
       datosventa.next();
       
       String IDVEN = datosventa.getString("ID_VENTA");
       String IDPRO = datosventa.getString("ID_PRODUCTO");
       String CANTI = datosventa.getString("CANTIDAD"); 

       out.print(IDVEN);
       out.print(IDPRO);
       out.print(CANTI);
   */  
       
       
       
      // try{
               


       //out.print(stock);

    
// catch(Exception e){
//       JOptionPane.showMessageDialog(null,"Producto no encontrado o no ingresado","Error",JOptionPane.ERROR_MESSAGE);
//	e.printStackTrace();
        
//        %> 

<script languaje="JavaScript"> 
    location.href='Ver_ventas_a_clientes_adm.jsp'; 
</script>


         <%      
   
   
  // }
%>

<%
        
       //String usuario = (String)Session.getAttribute("nombre");
       HttpSession sesion=request.getSession();
       String usuario = (String)sesion.getAttribute("nombre");

       sesion.setAttribute("nombre",usuario);
       out.print("<p>"+usuario+", Administrador</p>");
      
        

%>