<%-- 
    Document   : index
    Created on : Aug 8, 2024, 8:17:54 AM
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
        <title>Patient Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f8f9fa;
                font-family: Arial, sans-serif;
            }
            .navbar {
                background-color: #28a745;
            }
            .navbar-brand, .nav-link {
                color: #fff !important;
            }
            .welcome-message {
                color: #28a745;
                font-size: 24px;
                font-weight: bold;
                margin-top: 20px;
            }
            .card {
                border-radius: 10px;
                margin: 20px 0;
                border: none;
                box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
            }
            .card-header {
                background-color: #28a745;
                color: white;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
                font-weight: bold;
            }
            .btn-primary {
                background-color: #28a745;
                border-color: #28a745;
            }
            .btn-primary:hover {
                background-color: #218838;
                border-color: #1e7e34;
            }
            .card-body img {
                width: 50px;
                margin-bottom: 10px;
            }
            .container {
                max-width: 1200px;
            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg">
            <a class="navbar-brand" href="#">Patient Dashboard</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Welcome, <%=user.getName()%>!</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link btn btn-outline-light" href="../sign_out.jsp">Sign Out</a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container mt-5">
            <div class="text-center welcome-message">
                Welcome to  CayCare! 
            </div>

            <!-- Search Bar -->
            <div class="row search-bar">
                <div class="col-md-6 offset-md-3">
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2 w-75" id="searchInput" type="search" placeholder="Search Doctors or Departments" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="searchFunction()">Search</button>
                    </form>
                </div>
            </div>

            <!-- Search Results -->
            <div class="row mt-4" id="searchResults" style="display: none;">
                <div class="col-md-12">
                    <h5>Search Results:</h5>
                    <ul id="resultsList" class="list-group">
                        <!-- Dynamic Search Results Will Appear Here -->
                    </ul>
                </div>
            </div>

            <div class="row mt-4">
                <!-- Make Appointment Card -->
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-header">Make an Appointment</div>
                        <div class="card-body">
                            <%
                                if (request.getParameter("s") != null) {
                                    String message = request.getParameter("s").equals("1")
                                            ? "<h6 class='text-success'>You have successfully Make Appointment.</h6>"
                                            : "<h6 class='text-danger'>An error occurred. Please try again</h6>";
                                    out.println(message);
                                }
                            %>
                            <img src="https://th.bing.com/th/id/OIP.Mcw0qyUNaLJts2OYzDSv6wHaH5?w=163&h=180&c=7&r=0&o=5&dpr=1.5&pid=1.7" alt="Appointment Icon">
                            <form action="make_appointment.jsp" method="POST">
                                <div class="form-group">
                                    <input type="text" name="patient_ID" value="<%=user.getId()%>" hidden>
                                    <label for="doctor">Select Doctor</label>
                                    <select class="form-control" id="doctor" name="doctor_ID" required>
                                        <option value="5">Dr. John Smith</option>
                                        <option value="14">Dr. Sarah Johnson</option>
                                        <option value="15">Dr. Michael Chen</option>
                                        <option value="16">Dr. Emily Rodriguez</option>
                                        <option value="17">Dr. David Patel</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="appointment_date">Select Date</label>
                                    <input type="date" class="form-control" id="date" name="appointment_date" required>
                                </div>
                                <div class="form-group">
                                    <label for="appointment_time">Select Time</label>
                                    <input type="time" class="form-control" id="time" name="appointment_time" required>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block">Book Appointment</button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- View Appointments Card -->
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-header">View My Appointments</div>
                        <div class="card-body">
                            <img src="https://th.bing.com/th/id/OIP.QnpJAYNhGDW0V-ItKE2t2QHaJG?w=157&h=193&c=7&r=0&o=5&dpr=1.5&pid=1.7" alt="View Icon">
                            <a href="view_appointments.jsp" class="btn btn-primary btn-block">View Appointments</a>
                        </div>
                    </div>
                </div>

                <!-- View Doctor Availability Card -->
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-header">View Doctor Availability</div>
                        <div class="card-body">
                            <img src="https://th.bing.com/th/id/OIP.SYZ_tKA8uUkW8Q570S3xWgHaH0?w=209&h=220&c=7&r=0&o=5&dpr=1.5&pid=1.7" alt="Availability Icon">
                            <a href="view_availability.jsp" class="btn btn-primary btn-block">Check Availability</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Pay Appointment Charges Card -->
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-header">Pay Appointment Charges</div>
                        <div class="card-body">
                            <img src="https://cdn-icons-png.flaticon.com/512/1828/1828936.png" alt="Payment Icon">
                            <form action="pay_charges.jsp" method="POST">
                                <div class="form-group">
                                    <label for="appointment">Enter Appointment ID</label>
                                    <input type="text"  class="form-control" name="appoinment_ID" value="">
                                </div>
                                <div class="form-group">
                                    <label for="amount">Amount</label>
                                    <input type="number" class="form-control" id="amount" name="amount"  placeholder="Appointment charge is Rs. 1000"required>
                                </div>
                                <div class="form-group">
                                    <label for="payment_method">Select Payment Method</label>
                                    <select class="form-control" id="payement_method" name="payment_method">
                                        <option value="Cash Payment">Cash Payment</option>
                                        <option value="Card Payment">Card Payment</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block">Pay Now</button>
                                <%
                                if (request.getParameter("s") != null) {
                                    String message = request.getParameter("s").equals("1")
                                            ? "<h6 class='text-success'>You have successfully Make Payment.</h6>"
                                            : "<h6 class='text-danger'>An error occurred. Please try again</h6>";
                                    out.println(message);
                                }
                            %>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Additional Feature: Profile -->
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-header">My Profile</div>
                        <div class="card-body">
                            <img src="https://cdn-icons-png.flaticon.com/512/1144/1144760.png" alt="Profile Icon">
                            <a href="view_profile.php" class="btn btn-primary btn-block">View Profile</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <footer class="bg-light text-center py-4">
            <div class="container">
                <p class="mb-0">&copy; 2024 CayCare. All rights reserved.</p>
                <p>Designed by Group H</p>
            </div>
        </footer>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
                            function searchFunction() {
                                let input, filter, resultsList, li, txtValue;
                                input = document.getElementById("searchInput");
                                filter = input.value.toUpperCase();
                                resultsList = document.getElementById("resultsList");
                                resultsList.innerHTML = ""; // Clear previous results

                                const doctors = [
                                    {name: "Dr. John Smith", department: "Cardiology"},
                                    {name: "Dr. Sarah Johnson", department: "Neurology"},
                                    {name: "Dr. Michael Chen", department: "Orthopedics"},
                                    {name: "Dr. Emily Rodriguez", department: "Pediatrics"},
                                    {name: "Dr. David Patel", department: "General Surgery"}
                                ];

                                doctors.forEach(doctor => {
                                    if (doctor.name.toUpperCase().includes(filter) || doctor.department.toUpperCase().includes(filter)) {
                                        let li = document.createElement("li");
                                        li.className = "list-group-item";
                                        txtValue = `${doctor.name} - ${doctor.department}`;
                                                        li.appendChild(document.createTextNode(txtValue));
                                                        resultsList.appendChild(li);
                                                    }
                                                });

                                                if (resultsList.innerHTML === "") {
                                                    let li = document.createElement("li");
                                                    li.className = "list-group-item";
                                                    li.appendChild(document.createTextNode("No results found"));
                                                    resultsList.appendChild(li);
                                                }

                                                document.getElementById("searchResults").style.display = "block";
                                            }
        </script>
    </body>
</html>
