<%@ page import="java.util.logging.Logger" %>
<%@ page import="classes.DbConnector" %>
<%@ page import="classes.User" %>
<%@ page session="true" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%!
    User user = new User();
    boolean auth_key_is_enable = false;
    String auth_key = "";
    private static final Logger logger = Logger.getLogger("login.jsp");
%>

<%
    try {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie ck : cookies) {
                if (ck.getName().equals("auth")) {
                    auth_key_is_enable = true;
                    auth_key = ck.getValue();
                    logger.info("Auth cookie found: " + auth_key);
                }
            }
        }

        if (session.getAttribute("user_id") != null) {
            logger.info("User ID found in session: " + session.getAttribute("user_id"));
            String userRole = (String) session.getAttribute("user_role");
            response.sendRedirect(userRole + "/index.jsp");
        } else if (auth_key_is_enable) {
            user.setAuth_key(auth_key);
            if (user.authenticateByCookie(DbConnector.getConnection())) {
                Cookie ck = new Cookie("auth", user.getAuth_key());
                ck.setMaxAge(60 * 60 * 24 * 30);
                response.addCookie(ck);
                session.setAttribute("user_id", user.getId());
                session.setAttribute("user_role", user.getRole());
                logger.info("User authenticated by cookie, redirecting to dashboard");
                response.sendRedirect(user.getRole() + "/index.jsp");
            } else {
                logger.warning("Failed to authenticate user by cookie");
                response.sendRedirect("index.jsp");
            }
        } else {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            if (email != null && password != null) {
                user.setEmail(email);
                user.setPassword(password);
                if (user.authenticateByCredentials(DbConnector.getConnection())) {
                    if (request.getParameter("remember_me") != null) {
                        Cookie ck = new Cookie("auth", user.getAuth_key());
                        ck.setMaxAge(60 * 60 * 24 * 30);
                        response.addCookie(ck);
                    }
                    session.setAttribute("user_id", user.getId());
                    session.setAttribute("user_role", user.getRole());
                    logger.info("User authenticated by credentials, redirecting to dashboard");
                    response.sendRedirect(user.getRole() + "/index.jsp");
                } else {
                    logger.warning("Invalid email or password");
                    response.sendRedirect("log.jsp?error=1");
                }
            } else {
                logger.warning("Email or password not provided");
                response.sendRedirect("log.jsp?error=2");
            }
        }
    } catch(Exception e) {
        logger.severe("Exception occurred: " + e.getMessage());
        response.sendRedirect("log.jsp?error=3");
    }
%>