<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="classes.AvailabilityDetails" %>
<%@ page import="classes.DbConnector" %>
<%@ page import="classes.Availability" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Doctor Availability</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 8px 12px;
                border: 1px solid #ddd;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #f5f5f5;
            }
        </style>
    </head>
    <body>

        <h1>Doctor Availability</h1>

        <%
            Connection con = null;
            List<AvailabilityDetails> availabilityList = null;

            try {
                con = DbConnector.getConnection();
                availabilityList = Availability.getAvailability(con);

                if (availabilityList != null && !availabilityList.isEmpty()) {
        %>
        <table>
            <tr>
                <th>Doctor Name</th>
                <th>Specialty</th>
                <th>Day of Week</th>
                <th>Start Time</th>
                <th>End Time</th>
            </tr>
            <%
                for (AvailabilityDetails details : availabilityList) {
            %>
            <tr>
                <td><%= details.getDoctorName()%></td>
                <td><%= details.getSpeciality()%></td>
                <td><%= details.getDay_of_week()%></td>
                <td><%= details.getStart_time()%></td>
                <td><%= details.getEnd_time()%></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
        } else {
        %>
        <p>No available slots found.</p>
        <%
                }
            } catch (SQLException e) {
                out.println("<p>Error retrieving availability details: " + e.getMessage() + "</p>");
                e.printStackTrace();
            } finally {
                if (con != null) {
                    try {
                        con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>

    </body>
</html>
