<%-- 
    Document   : LoginEmp
    Created on : 12 Mar, 2020, 9:42:12 PM
    Author     : Albus
--%>

<%@page import="BeanPack.EmpMethods"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String empName = request.getParameter("empName");
            String password = request.getParameter("password");
            
            try {
                    ResultSet rs = EmpMethods.LogEmp(empName, password);
                    if(rs.next())
                    {
                        if(empName.equals(rs.getString(2).toString()) && password.equals(rs.getString(3).toString()))
                        {
                            session.setAttribute("empName", rs.getString(2).toString());
                            session.setAttribute("empID", rs.getInt(1));
                            
                            response.sendRedirect("EmpProject.jsp");
                        }
                        else
                        {
                            out.println("Wrong");
                        }
                    }
                    else
                    {
                        response.sendRedirect("LogEmp.jsp");
                    }
                } catch (Exception e) {
                }
        %>
    </body>
</html>
