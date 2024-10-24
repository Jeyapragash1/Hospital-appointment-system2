/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author User
 */
public class AppointmentDetails {

    private int appointment_ID;
    private String doctorName;
    private String speciality;
    private String departmentName;
    private String appointmentTime;
    private String appointmentDate;
    private String status;

    public AppointmentDetails(int appointment_ID, String doctorName, String speciality, String departmentName, String appointmentTime, String appointmentDate, String status) {
        this.appointment_ID = appointment_ID;
        this.doctorName = doctorName;
        this.speciality = speciality;
        this.departmentName = departmentName;
        this.appointmentTime = appointmentTime;
        this.appointmentDate = appointmentDate;
        this.status = status;
    }

    // Getters and toString() for display
    public int getAppointment_ID() {
        return appointment_ID;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public String getSpeciality() {
        return speciality;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public String getAppointmentTime() {
        return appointmentTime;
    }

    public String getAppointmentDate() {
        return appointmentDate;
    }

    public String getStatus() {
        return status;
    }

    @Override
    public String toString() {
        return "Appointment ID: " + appointment_ID
                + ", Doctor: " + doctorName
                + ", Specialty: " + speciality
                + ", Department: " + departmentName
                + ", Time: " + appointmentTime
                + ", Date: " + appointmentDate
                + ", Status: " + status;
    }
}
