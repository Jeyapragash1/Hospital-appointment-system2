/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class Appointment {

    private int appointment_ID;
    private final int patient_ID;
    private final int doctor_ID;
    private final String appointment_date;
    private final String appointment_time;

    public Appointment(int patient_ID, int doctor_ID, String appointment_date, String appointment_time) {
        this.patient_ID = patient_ID;
        this.doctor_ID = doctor_ID;
        this.appointment_date = appointment_date;
        this.appointment_time = appointment_time;
    }

    public boolean addAppointment(Connection con) throws SQLException {
        String query = "INSERT INTO appointment (patient_ID, doctor_ID, appointment_date, appointment_time) VALUES(?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);

        pstmt.setInt(1, this.patient_ID);
        pstmt.setInt(2, this.doctor_ID);
        pstmt.setString(3, this.appointment_date);
        pstmt.setString(4, this.appointment_time);

        return pstmt.executeUpdate() > 0;
    }

    public static List<AppointmentDetails> getAppointmentsByPatientId(Connection con, int patientId) throws SQLException {
        String query = "SELECT \n"
                + "    a.appointment_ID,\n"
                + "    u.name,\n"
                + "    d.speciality,\n"
                + "    dep.department_name,\n"
                + "    a.appointment_time,\n"
                + "    a.appointment_date,\n"
                + "    a.status\n"
                + "FROM \n"
                + "    appointment a\n"
                + "JOIN \n"
                + "    user u ON a.doctor_ID = u.user_ID\n"
                + "JOIN \n"
                + "    doctor d ON a.doctor_ID = d.doctor_ID\n"
                + "JOIN \n"
                + "    department dep ON d.department_ID = dep.department_ID\n"
                + "WHERE \n"
                + "    a.patient_ID = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, patientId);

        ResultSet rs = pstmt.executeQuery();

        List<AppointmentDetails> appointments = new ArrayList<>();
        while (rs.next()) {
            AppointmentDetails details = new AppointmentDetails(
                    rs.getInt("appointment_ID"),
                    rs.getString("name"),
                    rs.getString("speciality"),
                    rs.getString("department_name"),
                    rs.getString("appointment_time"),
                    rs.getString("appointment_date"),
                    rs.getString("status")
            );
            appointments.add(details);
        }
        return appointments;
    }
}
