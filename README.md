# Hospital Appointment Booking System

The Hospital Appointment Booking System is a web-based application designed to streamline the appointment scheduling process between patients and doctors. This system automates appointment management, reducing administrative workload and enhancing the patient experience. The platform allows patients to book, reschedule, and cancel appointments online while ensuring data security and 24/7 availability.

## Features

### Core Features:
- **Online Appointment Booking**: Patients can schedule appointments with their preferred doctor and department.
- **Appointment Rescheduling and Cancellation**: Allows patients to modify or cancel appointments easily.
- **Available Slots View**: Patients can view available appointment slots before booking.
- **Automated Reminders**: Patients receive reminders for upcoming appointments via email or SMS.
- **Doctor and Department Search**: Patients can search for doctors by specialization and department.
- **Patient Profile Management**: Patients can manage their profile details and view appointment history.
- **Appointment History and Reports**: Patients can access a detailed history of their appointments.

### User Roles:
1. **Patients**: Can register, book, reschedule, cancel appointments, and manage profiles.
2. **Doctors**: Can view appointments, update availability, and manage patient schedules.
3. **Administrative Staff**: Manage appointments, doctor availability, and system settings.

### Non-Functional Requirements:
- **User-Friendly**: The system provides an intuitive and responsive interface using HTML, CSS, and Bootstrap.
- **Speed**: Efficient processing to ensure quick response times for booking and cancellations.
- **Reliability**: Available 24/7 with a focus on uptime and consistency.
- **Security**: Data protection measures to secure confidential patient information.

## Technology Stack

- **Front-End**: HTML, CSS, Bootstrap
- **Back-End**: Java (Spring Boot)
- **Database**: MySQL
- **ORM**: Hibernate (for database interaction)

## System Architecture

This system follows a **well-structured design** based on **Object-Oriented Programming (OOP)** principles. Each component of the system is modularized to ensure scalability, maintainability, and reusability. 

### OOP Concepts Used:
- **Encapsulation**: Each class encapsulates its data and provides specific methods for interacting with that data, such as managing appointments, profiles, or doctor schedules.
- **Inheritance**: Common functionalities are abstracted into base classes and inherited by specialized components (e.g., user classes for patients, doctors, and administrative staff share a base `User` class).
- **Polymorphism**: Different user roles (patients, doctors, staff) can perform actions like viewing or managing appointments, with specific behaviors defined according to their role.
- **Abstraction**: Core system functionalities are abstracted into services (e.g., `AppointmentService`, `UserService`), ensuring the system's logic remains clean and organized.

The system is designed to be extendable, allowing for future enhancements without requiring significant changes to the codebase.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Jeyapragash1/hospital-appointment-booking-system.git
