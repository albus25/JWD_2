<%-- 
    Document   : EmpProject
    Created on : 15 Mar, 2020, 4:08:29 PM
    Author     : Albus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.*"%>
<%@page import="BeanPack.EmpBean"%>
<%@page import="java.sql.*"%>
<%@page import="BeanPack.EmpMethods"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String empName = (String) session.getAttribute("empName");
            int empID = (int) session.getAttribute("empID");
            request.setAttribute("empName", empName);
            request.setAttribute("empID", empID);
        %>
        <h3>
            <c:out value="${empName}"></c:out>
            <a href="AddUpd.jsp?empID=${empID}">Edit</a>
            <a href="Logout.jsp">Logout</a>
        </h3>
        <table border="2">
            <thead>
                <tr>
                    <td>Project Name</td>
                    <td>Description</td>
                    <td>Duration</td>
                </tr>
            </thead>
            <tbody>
        <%
            List<EmpBean> data = new ArrayList<EmpBean>();
            try {
                    ResultSet rs = EmpMethods.EmpProject(empID);
                    while(rs.next())
                    {
                        EmpBean eb = new EmpBean();
                        eb.setProjectName(rs.getString(1));
                        eb.setDescription(rs.getString(2));
                        eb.setDuration(rs.getString(3));
                        data.add(eb);
                    }
                    request.setAttribute("data", data);
                } catch (Exception e) {
                    e.printStackTrace();
                }
        %>
                <c:forEach var="key" items="${data}">
                    <tr>
                        <td>${key.getProjectName()}</td>
                        <td>${key.getDescription()}</td>
                        <td>${key.getDuration()}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
