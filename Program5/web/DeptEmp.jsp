<%-- 
    Document   : DeptEmp
    Created on : 8 Mar, 2020, 6:02:51 PM
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
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/employeedb", "root", "toor");
                    PreparedStatement pst = con.prepareStatement("select * from tbldepartment");
                    ResultSet rs = pst.executeQuery();
        %>
        <form>
            Department : <select name="deptCmb" onchange="getEmp(this)">
                <%
                    while(rs.next())
                    {
                %>
                <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                <%
                    }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </select>
            <div id="empList">
            </div>
        </form>
    </body>
</html>
<script>
    function getEmp(x)
    {
        var selVal = x.value;
        var selText = x.options[x.selectedIndex].innerHTML;
        
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function(){
            if(this.readyState == 4 && this.status == 200){
                document.getElementById("empList").innerHTML = this.responseText;
                console.log(this.responseText);
            }
        };
        xhttp.open("GET","EmpList.jsp?did="+selVal,true);
        xhttp.send();
    }
</script>