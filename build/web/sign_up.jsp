<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CayCare - Sign Up</title>
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
    <section class="text-center text-lg-start">
        <div class="container py-4">
            <nav class="navbar navbar-expand-lg navbar-light bg-white">
                <!-- Navbar content -->
            </nav>
            <div class="row g-0 align-items-center">
                <div class="col-lg-6 mb-5 mb-lg-0">
                    <div class="card cascading-right" style="background: hsla(0, 0%, 100%, 0.55); backdrop-filter: blur(30px);">
                        <div class="card-body p-5 shadow-5 text-center">
                            <h2 class="fw-bold mb-5">Sign Up</h2>
                            <%
                                if (request.getParameter("s") != null) {
                                    String message = request.getParameter("s").equals("1") ?
                                        "<h6 class='text-success'>You have successfully registered with CayCare.</h6>" :
                                        "<h6 class='text-danger'>An error occurred. Please register again</h6>";
                                    out.println(message);
                                }
                            %>
                            <form method="POST" action="registration.jsp">
                                <div class="form-outline mb-4">
                                    <input type="text" id="nameInput" name="name" class="form-control" placeholder="Full Name" required/>
                                </div>
                                <div class="form-outline mb-4">
                                    <input type="email" id="emailInput" name="email" class="form-control" placeholder="Email address" required/>
                                </div>
                                <div class="form-outline mb-4">
                                    <input type="password" id="passwordInput" name="password" class="form-control" placeholder="Password" required/>
                                </div>
                                <div class="form-outline mb-4">
                                    <input type="tel" id="phoneInput" name="phone_number" class="form-control" placeholder="Phone Number" required/>
                                </div>
                                <div class="form-outline mb-4">
                                    <input type="date" id="dobInput" name="dob" class="form-control" placeholder="Date of Birth"required/>
                                </div>
                                 <div class="form-outline mb-4">
                                    <input type="text" id="addressInput" name="address" class="form-control" placeholder="Address" required/>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block mb-4">
                                    Sign Up
                                </button>
                                <div class="text-center">
                                    <p>Already have an account? <a href="log.jsp">Sign in</a></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-5 mb-lg-0">
                    <img src="images/main-image.png" class="w-100 d-none d-lg-block" alt="" />
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

    <!-- Bootstrap JS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>