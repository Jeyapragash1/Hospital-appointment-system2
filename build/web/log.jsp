<%-- 
    Document   : log
    Created on : Aug 8, 2024, 12:00:44 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="classes.User"%>
<%! private static final Logger logger = Logger.getLogger("index.jsp");%>
<%
    Cookie[] cookies = request.getCookies();
    boolean auth_key_is_enable = false;
    if (cookies != null) {
        for (Cookie ck : cookies) {
            if (ck.getName().equals("auth")) {
                auth_key_is_enable = true;
                logger.info("Auth cookie found");
                break;
            }
        }
    }
%>
<%
    if (session.getAttribute("user_id") !=null && auth_key_is_enable) {
        response.sendRedirect("login.jsp");
    }

%>
<!DOCTYPE html>
<html>
     <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>CayCare- Place to channel your doctor</title>

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

        <!-- Font Awesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

        <style>
            .cascading-right {
                margin-right: -50px;
            }

            @media (max-width: 991.98px) {
                .cascading-right {
                    margin-right: 0;
                }
            }
        </style>
    </head>
    <body>
       
                <div class="row g-0 align-items-center">
                    <div class="col-lg-6 mb-5 mb-lg-0">
                        <div class="card cascading-right"
                             style="background: hsla(0, 0%, 100%, 0.55); backdrop-filter: blur(30px);">
                            <div class="card-body p-5 shadow-5 text-center">
                                <h2 class="fw-bold mb-5">Sign In</h2>
                                <%                                    if (request.getParameter("error") != null) {
                                        if (request.getParameter("error").equals("1")) {
                                %>
                                <h6 class="text-danger">Incorrect username or password.</h6>
                                <%
                                        }
                                    }
                                %>
                                <form action="login.jsp" method="POST">
                                    <!-- Email input -->
                                    <div class="form-outline mb-4">
                                        <input type="email" id="emailInput" name="email" class="form-control" placeholder="Email address" required/>
                                    </div>

                                    <!-- Password input -->
                                    <div class="form-outline mb-4">
                                        <input type="password" id="passwordInput" name="password" class="form-control" placeholder="Password" required/>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <input class="form-check-input" type="checkbox" value="" id="remember_me" name="remember_me">
                                                <label class="form-check-label" for="remember_me">
                                                    Remember Me
                                                </label> 
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <!-- Submit button -->
                                                <button type="submit" class="btn btn-primary btn-block mb-4">
                                                    Sign In
                                                </button> 
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <p>Don't have an account? <a href="sign_up.jsp">Sign up</a></p>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 mb-5 mb-lg-0">
                        <img src="images/main-image.png" class="w-100 d-none d-lg-block" alt="" />
                    </div>
                </div>
    </body>
</html>
