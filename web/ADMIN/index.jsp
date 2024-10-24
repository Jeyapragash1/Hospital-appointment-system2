<%-- 
    Document   : index
    Created on : Aug 8, 2024, 9:19:16 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="classes.User"%>
<%@page import="classes.DbConnector"%>
<%! 
 User user = new User();
%>
<% 
  
    if (session.getAttribute("user_id") != null) {
        int user_id = (Integer) session.getAttribute("user_id");
        user.setId(user_id);
        user = user.getUserById(DbConnector.getConnection());
    } else {
        response.sendRedirect("../index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    </head>
    <body>
        <h1>Admin World!</h1>
        <div class="card-body p-5 shadow-5 text-center">
                                <h2 class="fw-bold mb-4">Welcome, <%=user.getName()%>!
                                    <a href="../sign_out.jsp" ><button type="button" class="btn btn-info" id="signOutBtn">Sign Out</button></a>
                                </h2></div>
    </body>
</html>
