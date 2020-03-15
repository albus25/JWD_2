/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanPack;

import java.sql.*;
/**
 *
 * @author Albus
 */
public class EmpMethods {
    public static Connection con(){
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/program6db","root","toor");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
    
    public static int AddEmp(EmpBean e){
        int status = 0;
        try {
            PreparedStatement pst = EmpMethods.con().prepareStatement("insert into tblemployee values(0,?,?,?,?)");
            pst.setString(1, e.getEmpName());
            pst.setString(2, e.getPassword());
            pst.setString(3, e.getDesignation());
            pst.setInt(4, e.getDeptID());
            
            status = pst.executeUpdate();
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        return status;
    }
    
    public static ResultSet GetEmp(int id)
    {
        ResultSet rs = null;
        try {
            PreparedStatement pst = EmpMethods.con().prepareStatement("select * from tblemployee where empID = "+id);
            
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    public static int UpdEmp(EmpBean e)
    {
        int status = 0;
        try {
            PreparedStatement pst = EmpMethods.con().prepareStatement("update tblemployee set empName = ?,password = ?,designation = ?,deptID = ? where empID = "+e.getEmpID());
            
            pst.setString(1, e.getEmpName());
            pst.setString(2, e.getPassword());
            pst.setString(3, e.getDesignation());
            pst.setInt(4, e.getDeptID());
            
            status = pst.executeUpdate();
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        
        return status;
    }
    
    public static int DelEmp(int id)
    {
        int status = 0;
        try {
            PreparedStatement pst = EmpMethods.con().prepareStatement("delete from tblemployee where empID = "+id);
            
            status = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    
    public static ResultSet LogEmp(String empName,String password)
    {
        ResultSet rs = null;
        try {
            PreparedStatement pst = EmpMethods.con().prepareStatement("select empID,empName,password from tblemployee where empName = ? and password = ?");
            
            pst.setString(1, empName);
            pst.setString(2, password);
            
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    public static ResultSet EmpProject(int empID)
    {
        ResultSet rs = null;
        try {
            PreparedStatement pst = EmpMethods.con().prepareStatement("select p.projectName,p.description,p.duration from tblemployee e,tblproject p,tblprojectassign pa"
                    + " where pa.projectID = p.projectID and e.empID = pa.empID and e.empID = "+empID);
            
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    public static ResultSet DeptList()
    {
        ResultSet rs = null;
        try {
            PreparedStatement pst = EmpMethods.con().prepareStatement("select * from tbldepartment");
            
            rs = pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
}
