/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package TagPack;

import java.io.StringWriter;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author Albus
 */
public class ReverseString extends SimpleTagSupport {
    private String str;

    public String getStr() {
        return str;
    }

    public void setStr(String str) {
        this.str = str;
    }
    /**
     * Called by the container to invoke this tag. The implementation of this method is provided by the tag library developer, and handles all tag processing, body iteration, etc.
     */
    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();
        try {
            char[] ch = getStr().toCharArray();
            for(int i=(ch.length)-1;i>=0;i--){
                out.println(ch[i]);
            }
        } catch (java.io.IOException ex) {
            throw new JspException("Error in ReverseString tag", ex);
        }
    }
    
}
