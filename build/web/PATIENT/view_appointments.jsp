<%-- 
    Document   : view_appointments
    Created on : Aug 10, 2024, 10:03:49 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.AppointmentDetails"%>
<%@page import="java.util.List"%>
<%@page import="classes.Appointment"%>
<%@page import="classes.DbConnector"%>
<%

    int patientId = (Integer) session.getAttribute("user_id");
    List<AppointmentDetails> appointments = Appointment.getAppointmentsByPatientId(DbConnector.getConnection(), patientId);

%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Appointments</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>

        <div class="container mt-5">
            <h2>My Appointments</h2>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Appointment ID</th>
                        <th>Doctor Name</th>
                        <th>Specialty</th>
                        <th>Department</th>
                        <th>Time</th>
                        <th>Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%                for (AppointmentDetails appointment : appointments) {
                    %>
                    <tr>
                        <td><%=appointment.getAppointment_ID()%></td>
                        <td><%=appointment.getDoctorName()%></td>
                        <td><%=appointment.getSpeciality()%></td>
                        <td><%=appointment.getDepartmentName()%></td>
                        <td><%=appointment.getAppointmentTime()%></td>
                        <td><%=appointment.getAppointmentDate()%></td>
                        <td><%=appointment.getStatus()%></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>

    </body>
</html>
