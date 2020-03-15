<%-- 
    Document   : LogEmp
    Created on : 12 Mar, 2020, 9:38:24 PM
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
        <form method="post" action="LoginEmp.jsp">
            <table border="1">
                    <tr>
                        <td>UserName</td>
                        <td><input type="text" name="empName" required></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" required></td>
                    </tr>
                    <tr>
                        <td colspan="2"><center><input type="submit" value="Login"></center></td>
                    </tr>
                    <tr>
                        <td colspan="2"><center><a href="AddUpd.jsp">Not yet registered?</a></center></td>
                    </tr>
            </table>
        </form>
    </body>
</html>
