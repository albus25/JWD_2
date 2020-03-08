<%-- 
    Document   : selection
    Created on : 8 Mar, 2020, 4:25:25 PM
    Author     : Albus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <c:import url="emp.xml" var="e1"/>
        <x:parse xml="${e1}" var="res"/>
        
        <form>
            Department : <select name="deptCombo" onchange="this.form.submit()">
                <x:forEach var="key" select="$res/employees/employee">
                    <option><x:out select="deptName"/></option>
                </x:forEach>
            </select>
        </form>
        <hr>
        
        <c:if test="${not empty param.deptCombo}">
            <c:set value="${param.deptCombo}" var="key"/>
            <x:forEach var="key1" select="$res/employees/employee">
                <x:if select="deptName = $key">
                    EmpName : <x:out select="empName"/>
                    <br>
                    DeptName : <x:out select="deptName"/>
                    <hr>
                </x:if>
            </x:forEach>
        </c:if>
    </body>
</html>
