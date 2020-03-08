/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TagPack;

import java.sql.*;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author Albus
 */
public class EmpDeptTag extends SimpleTagSupport {

    private String dept;
    Connection con;
    /**
     * Called by the container to invoke this tag. The implementation of this method is provided by the tag library developer, and handles all tag processing, body iteration, etc.
     */
    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();
        
        try {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/employeedb","root","toor");
                
                PreparedStatement pst = con.prepareStatement("select e.*,d.deptName from tblemployee e,tbldepartment d where e.deptID = d.deptID and d.deptName = '"+getDept().toString()+"'");
                ResultSet rs = pst.executeQuery();
                
                while(rs.next())
                {
                    out.println("EmpName : "+rs.getString(2));
                }
                
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception ex) {
            throw new JspException("Error in EmpDeptTag tag", ex);
        }
    }

    public String getDept() {
        return dept;
    }

    public void setDept(String dept) {
        this.dept = dept;
    }
    
}
