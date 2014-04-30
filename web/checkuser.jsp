<%@page import = "java.sql.*" %>
<%@page import = "oracle.jdbc.driver.*" %>
<%@page contentType="text/html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                   
            String rut = request.getParameter("rut");
            String password2 = request.getParameter("password");
           
            String sql = "select * from machi.usuario";
            String driver = "oracle.jdbc.OracleDriver";
            String url = "jdbc:oracle:thin:@localhost:1521:XE";
            String username = "machi";
            String password = "12345";
            Class.forName(driver);
            Connection conn = DriverManager.getConnection(url,username,password);
            Statement stm = conn.createStatement();
           
            ResultSet ciclo = stm.executeQuery(sql);
           
            while(ciclo.next()){
                String rut2 = ciclo.getString("rut");
                String password3 = ciclo.getString("contraseña");
                String tipo = ciclo.getString("tipo");
                if(rut.equals(rut) && password2.equals(password3)){
                    if(tipo.equals("Administrador")){
                    %><script language="JavaScript">
                        location.href="inicioadmin.jsp";
                                        </script><%
                    }
                    else if(tipo.equals("Vendedor")){
                        %><script language="JavaScript">
                            location.href="iniciovendedor.jsp";
                                                    </script><%
                    }
                }
             }
               
                   
            if(rut == "" || password2 == ""){
                %><script language="JavaScript">
                    alert("hay una casilla vacia, porfavor vuelva a ingresar");
                    location.href="index.jsp";
                                </script><%
            }
           
            else{
                %><script language="JavaScript">
                    alert("Datos erroneos, vuelva a ingresar");
                    location.href="index.jsp";
                                </script><%
            }
            %>
      </body>
</html>