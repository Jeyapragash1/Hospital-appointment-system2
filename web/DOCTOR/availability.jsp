<%-- 
    Document   : availability
    Created on : Aug 9, 2024, 8:22:17 PM
    Author     : User
--%>

<%@page import="classes.DbConnector"%>
<%@page import="classes.Availability"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import = "classes.Doctor"%>
<%@ page import="java.util.logging.Logger" %>

<%! int doctor_ID;
    String day_of_week, start_time, end_time;%>
<%
    doctor_ID = Integer.parseInt(request.getParameter("doctor_ID"));
    day_of_week = request.getParameter("day_of_week");
    start_time = request.getParameter("start_time");
    end_time = request.getParameter("end_time");

    Availability availability = new Availability(doctor_ID, day_of_week, start_time, end_time);
    
    try {
            if (availability.addAvailability(DbConnector.getConnection())) {
                response.sendRedirect("index.jsp?s=1");
            } else {
                response.sendRedirect("index.jsp?s=0");
            }
        } catch (Exception e) {
            response.sendRedirect("index.jsp?s=0");
        }
    
%>

