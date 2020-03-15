<%-- 
    Document   : Logout
    Created on : 12 Mar, 2020, 9:58:35 PM
    Author     : Albus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  
            if(session.getAttribute("empName")!=null)
            {
                session.invalidate();
                response.sendRedirect("LogEmp.jsp");
            }
            else
            {
                response.sendRedirect("AddUpd.jsp");
            }
        %>
    </body>
</html>
