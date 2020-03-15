<%-- 
    Document   : AddUpdate
    Created on : 15 Mar, 2020, 5:00:07 PM
    Author     : Albus
--%>

<%@page import="BeanPack.EmpMethods"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="eb" class="BeanPack.EmpBean"/>
        <jsp:setProperty property="*" name="eb"/>
        <%
            String empID = (String) request.getParameter("empID");
            if(empID != null && empID != "")
            {
                int sts = EmpMethods.UpdEmp(eb);
                if(sts > 0)
                {
                    response.sendRedirect("EmpProject.jsp");
                }
                else
                {
                    out.println("Not done");
                }
            }
            else
            {
                int sts = EmpMethods.AddEmp(eb);
                if(sts > 0)
                {
                    response.sendRedirect("LoginEmp.jsp");
                }
                else
                {
                    out.println("Not done");
                }
            }
        %>
    </body>
</html>
