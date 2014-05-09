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
    try{
       String rutcliente = request.getParameter("rut");
       out.print("<p>"+rutcliente+"</p>");
       
       String driver = "oracle.jdbc.OracleDriver";
       String url = "jdbc:oracle:thin:@localhost:1521:XE";
       String username = "system";
       String password = "bd";
       Class.forName(driver);
       Connection conn = DriverManager.getConnection(url,username,password);
       Statement stm = conn.createStatement();
                    

       String sql1 = "select * from BD.VENTA inner join BD.DETALLE_VENTA on BD.VENTA.ID_VENTA = BD.DETALLE_VENTA.ID_VENTA where BD.VENTA.ID_CLIENTE='"+rutcliente+"'";
            
       ResultSet datosventa = stm.executeQuery(sql1);

       out.print("<table>");
       out.print("<tr>"
               + "<th>ID VENTA</td>"
               + "<th>ID PRODUCTO</td>"
               + "<th>CANTIDAD</td>"
               + "</tr>");
       while (datosventa.next()){
           int IDVEN = datosventa.getInt("ID_VENTA");
           int IDPRO = datosventa.getInt("ID_PRODUCTO");
           int CANTI = datosventa.getInt("CANTIDAD"); 
            
            out.print("<tr>");
            out.print("<td>"+IDVEN+"</td>");
            out.print("<td>"+IDPRO+"</td>");
            out.print("<td>"+CANTI+"</td>");
            out.print("</tr>");
                    }
       out.print("</table>");
       
            } catch (SQLException error2) {
                out.println("Error SQL" + error2.getMessage());
            } catch (Exception error3) {
                out.println("Se ha producido una excepción try " + error3.getMessage());
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