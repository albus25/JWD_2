<%-- 
    Document   : SessionTrack
    Created on : 11 Mar, 2020, 9:40:46 PM
    Author     : Albus
--%>

<%@page import="java.util.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            // Get session creation time.
            Date createTime = new Date(session.getCreationTime());

            // Get last access time of this Webpage.
            Date lastAccessTime = new Date(session.getLastAccessedTime());

            String title = "Welcome Back Here";
            Integer visitCount = new Integer(0);
            String visitCountKey = new String("visitCount");
            String userIDKey = new String("userID");
            String userID = new String("Albus");

            // Check if this is new comer on your Webpage.
            if (session.isNew() ){
               title = "Welcome Here";
               session.setAttribute(userIDKey, userID);
               session.setAttribute(visitCountKey,  visitCount);
            } 
            visitCount = (Integer)session.getAttribute(visitCountKey);
            visitCount = visitCount + 1;
            userID = (String)session.getAttribute(userIDKey);
            session.setAttribute(visitCountKey,  visitCount);
        %>
        <h3><% out.println(title); %></h3>
        <h3>SessionID : <%= session.getId() %></h3>
        <h3>CreateTime : <%= createTime %></h3>
        <h3>LastAccessTime : <%= lastAccessTime %></h3>
        <h3>UserID : <%= userID %></h3>
        <h3>Visited : <%= visitCount %> Times</h3>
    </body>
</html>
