<%-- 
    Document   : index
    Created on : Aug 6, 2024, 6:49:12 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Appointment Booking System</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">CayCare</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">About</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Services</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
                <li class="nav-item"><a class="nav-link btn btn-primary text-white ml-2" href="sign_up.jsp">Sign Up</a></li>
                <li class="nav-item"><a class="nav-link btn btn-secondary text-white ml-2" href="log.jsp">Sign In</a></li>
            </ul>
        </div>
    </nav>

    <!-- Hero Section -->
    <header class="hero text-center">
        <div class="container">
            <h1 class="display-4">Medical and Health Centre Booking System</h1>
            <p class="lead">For all medical, health and wellness businesses</p>
            <a href="#" class="btn btn-danger btn-lg mr-2">Get a Free Account</a>
            <a href="#" class="btn btn-info btn-lg">Get Inspired</a>
            <p class="mt-4">No credit card needed</p>
        </div>
    </header>

    <!-- Services Section -->
    <section class="services py-5 text-center">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <img src="images/hospital.jpg" class="card-img-top" alt="Medical Clinics & Doctors">
                            <h5 class="card-title mt-3">Medical Clinics & Doctors</h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <img src="images/hospital.jpg" class="card-img-top" alt="Dentists">
                            <h5 class="card-title mt-3">Dentists</h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <img src="images/hospital.jpg" class="card-img-top" alt="Chiropractics">
                            <h5 class="card-title mt-3">Chiropractics</h5>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <img src="images/hospital.jpg" class="card-img-top" alt="Acupuncture">
                            <h5 class="card-title mt-3">Acupuncture</h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <img src="images/hospital.jpg" class="card-img-top" alt="Massage">
                            <h5 class="card-title mt-3">Massage</h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <img src="images/hospital.jpg"class="card-img-top" alt="Psychologists">
                            <h5 class="card-title mt-3">Psychologists</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-light text-center py-4">
        <div class="container">
            <p class="mb-0">&copy; 2024 CayCare. All rights reserved.</p>
            <p>Designed by Group H</p>
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="scripts/main.js"></script>
</body>
</html>
