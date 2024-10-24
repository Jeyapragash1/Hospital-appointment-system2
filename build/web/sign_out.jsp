<%-- 
    Document   : sign_out
    Created on : Aug 7, 2024, 8:44:21 PM
    Author     : User
--%>

<%
    session.invalidate();
    Cookie ck = new Cookie("auth", "");
    ck.setMaxAge(0);
    response.addCookie(ck);
    response.sendRedirect("index.jsp");
%>
