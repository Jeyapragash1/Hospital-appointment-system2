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
public class Availability {

    private int availabily_ID;
    private final int doctor_ID;
    private final String day_of_week;
    private final String start_time;
    private final String end_time;

    public Availability(int doctor_ID, String day_of_week, String start_time, String end_time) {
        this.doctor_ID = doctor_ID;
        this.day_of_week = day_of_week;
        this.start_time = start_time;
        this.end_time = end_time;
    }

    public boolean addAvailability(Connection con) throws SQLException {
        String query = "INSERT INTO availability (doctor_ID, day_of_week, start_time, end_time) VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, this.doctor_ID);
        pstmt.setString(2, this.day_of_week);
        pstmt.setString(3, this.start_time);
        pstmt.setString(4, this.end_time);

        return pstmt.executeUpdate() > 0;
    }

    public static List<AvailabilityDetails> getAvailability(Connection con) throws SQLException {
        String query = "SELECT \n"
                + "    u.name AS doctor_name,\n"
                + "    d.speciality,\n"
                + "    a.day_of_week,\n"
                + "    a.start_time,\n"
                + "    a.end_time\n"
                + "FROM \n"
                + "    availability a\n"
                + "JOIN \n"
                + "    doctor d ON a.doctor_ID = d.doctor_ID\n"
                + "JOIN \n"
                + "    user u ON d.doctor_ID = u.user_ID\n"
                + "WHERE \n"
                + "    u.role = 'DOCTOR'\n"
                + "ORDER BY \n"
                + "    u.name, a.day_of_week, a.start_time";

        PreparedStatement pstmt = con.prepareStatement(query);

        ResultSet rs = pstmt.executeQuery();

        List<AvailabilityDetails> availability = new ArrayList<>();
        while (rs.next()) {
            AvailabilityDetails details = new AvailabilityDetails(
                    rs.getString("doctor_name"), 
                    rs.getString("speciality"),
                    rs.getString("day_of_week"),
                    rs.getString("start_time"),
                    rs.getString("end_time")
            );
            availability.add(details); 
        }
        return availability;
    }

}
