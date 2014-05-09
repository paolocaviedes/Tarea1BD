<%@page import="javax.swing.JOptionPane"%>
<!-- Los import -->
<%@ page language="java" import="java.sql.*"
         import = "java.sql.Connection"
         import = "java.sql.DriverManager"
         import = "java.sql.ResultSet"
         import = "oracle.jdbc.driver.*" 
         import = "java.sql.Statement"
%>

<%
                       
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String login = "system";
	String password = "bd";
	String user = request.getParameter("l_nombre");
        String pass = request.getParameter("l_clave");
        
        
        
	PreparedStatement stmnt = null;
        
	Connection conexion = null;
			 
	Class.forName(driver).newInstance();
	conexion = DriverManager.getConnection(url, login, password);
	
        try{
        Statement st = conexion.createStatement();
        ResultSet rs = st.executeQuery("select * from bd.usuario where nombre ='"+user+"'");
        
        //out.print(user);
        //out.print(pass);

      rs.next();
     String tipo = rs.getString("tipo");
     session.setAttribute("nombre", user);
      String pass_bd = rs.getString("contraseña");
      //out.print(pass_bd);
      if (pass_bd.equals(pass))
      { 
         // rs.next();
          //String cadena = "LOGUEADO";
          //out.println(cadena);
               
          if(tipo.equals("Administrador")){
              response.sendRedirect("Menu_administrador.jsp");
                    }
          else if(tipo.equals("Vendedor")){
                    response.sendRedirect("Menu_vendedor.jsp");
                        
                    }
          
          
          
          //response.sendRedirect("Menu_administrador.jsp");
      }
      else
      {
          JOptionPane.showMessageDialog(null,"Contraseña Inválida","Error",JOptionPane.ERROR_MESSAGE);
           
           response.sendRedirect("index.jsp");
	  }
      
      conexion.close();
      
	}
        
	
        catch (Exception e){
                JOptionPane.showMessageDialog(null,"Log-in Erróneo","Error",JOptionPane.ERROR_MESSAGE);
	    	e.printStackTrace();
        }
	finally {
		if (conexion != null) {
			try{
				stmnt.close();
                                
              conexion.close();
			}
		catch(Exception e){
                    
					e.printStackTrace();
			}
	    }
	}
             
%>
<html>

<head>
<script languaje="JavaScript">
location.href="index.jsp";
</script>
</head>
</html>
