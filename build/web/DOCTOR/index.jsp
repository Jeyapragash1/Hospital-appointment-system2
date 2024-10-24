<%-- 
    Document   : index
    Created on : Aug 8, 2024, 9:20:18 AM
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
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Doctor Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                font-family: Arial, sans-serif;
            }

            .sidebar {
                height: 100vh;
                padding-top: 20px;
            }

            .content {
                padding: 20px;
            }

            .tab-content {
                display: none;
            }

            .tab-content.active {
                display: block;
            }

            .table {
                margin-top: 20px;
            }

        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">Doctor Dashboard</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Welcome,<%=user.getName()%>!</a>
                    </li>
                    <li class="nav-item">
                        <a href="../sign_out.jsp" ><button class="btn btn-outline-info my-2 my-sm-0" type="submit">Sign Out</button></a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3 bg-light sidebar">
                    <div class="list-group list-group-flush">
                        <a href="#manageAvailability" class="list-group-item list-group-item-action">Manage Availability</a>
                        <a href="#viewAppointments" class="list-group-item list-group-item-action">View Appointment List</a>
                    </div>
                </div>
                <div class="col-md-9 content">
                    <div id="manageAvailability" class="tab-content">
                        <h3>Manage Availability</h3>
                        <%
                            if (request.getParameter("s") != null) {
                                String message = request.getParameter("s").equals("1")
                                        ? "<h6 class='text-success'>You have successfully Update Availability.</h6>"
                                        : "<h6 class='text-danger'>An error occurred. Please try again</h6>";
                                out.println(message);
                            }
                        %>
                        <form action="availability.jsp" method="POST">
                            <div class="form-group">
                                <label for="doctorID">Doctor ID</label>
                                <input type="number" class="form-control" id="doctorID" name="doctor_ID" required>
                            </div>

                            <div class="form-group">
                                <label for="dayOfWeek">Day of the Week</label>
                                <select class="form-control" id="dayOfWeek" name="day_of_week" required>
                                    <option value="MONDAY">Monday</option>
                                    <option value="TUESDAY">Tuesday</option>
                                    <option value="WEDNESDAY">Wednesday</option>
                                    <option value="THURSDAY">Thursday</option>
                                    <option value="FRIDAY">Friday</option>
                                    <option value="SATURDAY">Saturday</option>
                                    <option value="SUNDAY">Sunday</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="startTime">Start Time</label>
                                <input type="time" class="form-control" id="startTime" name="start_time" required>
                            </div>

                            <div class="form-group">
                                <label for="endTime">End Time</label>
                                <input type="time" class="form-control" id="endTime" name="end_time" required>
                            </div>

                            <button type="submit" class="btn btn-primary">Update Availability</button>
                        </form>
                    </div>

                    <div id="viewAppointments" class="tab-content">
                        <h3>Appointment List</h3>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Patient Name</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Jane Doe</td>
                                    <td>2024-08-10</td>
                                    <td>10:00 AM</td>
                                    <td>Confirmed</td>
                                </tr>
                                <tr>
                                    <td>John Doe</td>
                                    <td>2024-08-11</td>
                                    <td>11:00 AM</td>
                                    <td>Pending</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const tabs = document.querySelectorAll('.list-group-item');
                const contents = document.querySelectorAll('.tab-content');

                tabs.forEach(tab => {
                    tab.addEventListener('click', function () {
                        contents.forEach(content => content.classList.remove('active'));
                        const target = document.querySelector(this.getAttribute('href'));
                        target.classList.add('active');
                    });
                });

                // Show the first tab by default
                tabs[0].click();
            });

        </script>
    </body>
</html>

