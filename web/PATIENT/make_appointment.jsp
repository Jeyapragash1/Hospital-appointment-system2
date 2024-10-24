<%-- 
    Document   : make_appointment
    Created on : Aug 9, 2024, 11:08:10 PM
    Author     : User
--%>

<%@page import="classes.DbConnector"%>
<%@page import="classes.Appointment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    int patient_ID, doctor_ID;
    String appointment_date, appointment_time;
%>
<% 
  patient_ID = Integer.parseInt(request.getParameter("patient_ID"));
  doctor_ID = Integer.parseInt(request.getParameter("doctor_ID"));
  appointment_date = request.getParameter("appointment_date");
  appointment_time = request.getParameter("appointment_time");
  
  Appointment appointment = new Appointment(patient_ID, doctor_ID, appointment_date, appointment_time);
  try {
            if (appointment.addAppointment(DbConnector.getConnection())) {
                response.sendRedirect("index.jsp?s=1");
            } else {
                response.sendRedirect("index.jsp?s=0");
            }
        } catch (Exception e) {
            response.sendRedirect("index.jsp?s=0");
        }
%>

