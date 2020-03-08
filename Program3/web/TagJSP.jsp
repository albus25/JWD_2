<%-- 
    Document   : reverseString
    Created on : 8 Mar, 2020, 2:14:45 PM
    Author     : Albus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/tlds/customeLibrary.tld" prefix="t"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <span>Connection Tag : </span><t:ConnectionTag></t:ConnectionTag>
        <hr>
        <span>Reverse String : </span><t:ReverseString str="Hello Albus"></t:ReverseString>
        <hr>
        <span>Department Name : </span><t:EmpDeptTag dept="Gryffindor"></t:EmpDeptTag>
    </body>
</html>
