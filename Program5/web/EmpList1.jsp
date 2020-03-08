<%-- 
    Document   : EmpList1
    Created on : 8 Mar, 2020, 10:55:26 PM
    Author     : Albus
--%>

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
            try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/employeedb","root","toor");
                    String deptID = request.getParameter("did");
                    String empName = request.getParameter("emp");
//                    out.println("Emp:"+empName);
//                    out.println("Dept:"+deptID);
//                    if(!deptID.equals("") && deptID != null){
//                        PreparedStatement pst = con.prepareStatement("select e.* from tblemployee e,tbldepartment d where d.deptID = e.deptID and d.deptID = " + Integer.parseInt(deptID));
//                        ResultSet rs = pst.executeQuery();
//                        out.println("Employee : <select name='empCmb'>");
//                        while(rs.next())
//                        {
//                            out.println("<option value='" + rs.getInt(1) + "'>" + rs.getString(2) + "</option>");
//                        }                        
//                        out.println("</select>");
//                    }
                    if(!empName.equals("") && empName != null){
                        PreparedStatement pst = con.prepareStatement("select * from tblemployee where empName like '" + empName + "%'");
                        ResultSet rs = pst.executeQuery();
                        while(rs.next())
                        {
                            out.println("EmpName : " + rs.getString(2) + "<br>");
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
        %>
    </body>
</html>
