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
public class AvailabilityDetails {

    private final String doctorName;
    private final String speciality;
    private final String day_of_week;
    private final String start_time;
    private final String end_time;

    public AvailabilityDetails(String doctorName, String speciality, String day_of_week, String start_time, String end_time) {
        this.doctorName = doctorName;
        this.speciality = speciality;
        this.day_of_week = day_of_week;
        this.start_time = start_time;
        this.end_time = end_time;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public String getSpeciality() {
        return speciality;
    }

    public String getDay_of_week() {
        return day_of_week;
    }

    public String getStart_time() {
        return start_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    @Override
    public String toString() {
        return " Doctor: " + doctorName
                + ", Specialty: " + speciality
                + ", Day of Week: " + day_of_week
                + ", Start Time: " + start_time
                + ", End Time: " + end_time;
    }
}
