<%-- 
    Document   : AddUpd
    Created on : 12 Mar, 2020, 9:04:27 AM
    Author     : Albus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="BeanPack.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String empID = (String) request.getParameter("empID");
            if(empID != null && empID != "")
            {
                try {
                        ResultSet rs = EmpMethods.GetEmp(Integer.parseInt(empID));
                        List<EmpBean> ls = new ArrayList<EmpBean>();
                        while(rs.next())
                        {
                            EmpBean eb = new EmpBean();
                            eb.setEmpID(rs.getInt(1));
                            eb.setEmpName(rs.getString(2));
                            eb.setPassword(rs.getString(3));
                            eb.setDesignation(rs.getString(4));
                            eb.setDeptID(rs.getInt(5));
                            ls.add(eb);
                        }
                        request.setAttribute("ls", ls);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
        %>
        <c:forEach var="key1" items="${ls}">
            <form method="post" action="AddUpdate.jsp" id="frm">
                <table>
                    <tr>
                        <td>ID</td>
                        <td><input type="text" name="empID" value="${key1.getEmpID()}" readonly></td>
                    </tr>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="empName" value="${key1.getEmpName()}"></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" id="pass"></td>
                    </tr>
                    <tr>
                        <td>Confirm Password</td>
                        <td><input type="password" name="password" id="cpass"><span id="err"></span></td>
                    </tr>
                    <tr>
                        <td>Designation</td>
                        <td><input type="text" name="designation" value="${key1.getDesignation()}"></td>
                    </tr>
                    <%
                        try {
                                List<EmpBean> data = new ArrayList<EmpBean>();
                                ResultSet rs1 = EmpMethods.DeptList();
                                while(rs1.next())
                                {
                                    EmpBean eb = new EmpBean();
                                    eb.setDeptID(rs1.getInt(1));
                                    eb.setDeptName(rs1.getString(2));
                                    data.add(eb);
                                }
                                request.setAttribute("data", data);
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                    %>
                    <tr>
                        <td>Department</td>
                        <td>
                            <c:set value="${key1.getDeptID()}" var="rdID"/>
                            <select name="deptID">
                                <c:forEach var="key" items="${data}">
                                    <c:choose>
                                        <c:when test="${key.getDeptID() == rdID}">
                                            <option value="${key.getDeptID()}" selected>${key.getDeptName()}</option>                        
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${key.getDeptID()}">${key.getDeptName()}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><center><input type="submit" value="Register"></center></td>
                    </tr>
                </table>
            </form>
        </c:forEach>
        <%}else{%>
        <form method="post" action="AddUpdate.jsp" id="frm">
            <table>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="empName"></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" id="pass"></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td><input type="password" name="password" id="cpass"><span id="err"></span></td>
                </tr>
                <tr>
                    <td>Designation</td>
                    <td><input type="text" name="designation"></td>
                </tr>
                <%
                    try {
                            List<EmpBean> data = new ArrayList<EmpBean>();
                            ResultSet rs = EmpMethods.DeptList();
                            while(rs.next())
                            {
                                EmpBean eb = new EmpBean();
                                eb.setDeptID(rs.getInt(1));
                                eb.setDeptName(rs.getString(2));
                                data.add(eb);
                            }
                            request.setAttribute("data", data);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                %>
                <tr>
                    <td>Department</td>
                    <td>
                        <select name="deptID">
                            <c:forEach var="key" items="${data}">
                                <option value="${key.getDeptID()}">${key.getDeptName()}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><center><input type="submit" value="Register"></center></td>
                </tr>
            </table>
        </form>
        <%}%>
    </body>
</html>
<script>
    document.getElementById("frm").onsubmit = function(){
        var pass = document.getElementById("pass").value;
        var cpass = document.getElementById("cpass").value;
        var err = document.getElementById("err");
        if(pass != "" && cpass != "")
        {
            if(cpass != pass)
            {
                err.innerHTML = "Password does not match";
                console.log("1");
                return false;
            }
            else
            {
                err.innerHTML = "Password matched";
                console.log("2");
                return true;
            }
        }
        else
        {
            err.innerHTML = "Password or Confirm password is empty";
            return false;
        }
    };
</script>