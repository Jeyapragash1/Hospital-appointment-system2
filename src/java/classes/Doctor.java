/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class Doctor extends User {

    private String speciality;
    private String register_no;
    private String department_ID;
    

    private static final Logger logger = Logger.getLogger(Patient.class.getName());
    
    public Doctor() {
        super();
    }
    
    public Doctor(String name, String email, String password, String phone_number, String dob, String speciality, String register_no, String department_ID) {
        super(name, email, password, phone_number, dob, "DOCTOR");
        this.speciality = speciality;
        this.register_no = register_no;
        this.department_ID = department_ID;
    }
    
        public boolean registerDoctor(Connection con) throws SQLException {
        con.setAutoCommit(false);
        try {
            // First, register the user
            if (super.register(con)) {
                // Get the auto-generated user_ID
                String getUserIdQuery = "SELECT user_ID FROM User WHERE email = ?";
                try (PreparedStatement pstmt = con.prepareStatement(getUserIdQuery)) {
                    pstmt.setString(1, this.getEmail());
                    ResultSet rs = pstmt.executeQuery();
                    if (rs.next()) {
                        int userId = rs.getInt("user_ID");
                        this.setId(userId);

                        // Now insert into Patient table
                        String insertPatientQuery = "INSERT INTO Doctor (doctor_ID, speciality, register_no,department_ID) VALUES (?, ?, ?)";
                        try (PreparedStatement patientStmt = con.prepareStatement(insertPatientQuery)) {
                            patientStmt.setInt(1, userId);
                            patientStmt.setString(2, this.speciality);
                            patientStmt.setString(2, this.register_no);
                            patientStmt.setString(2, this.department_ID);
                            int result = patientStmt.executeUpdate();
                            if (result > 0) {
                                con.commit();
                                return true;
                            }
                        }
                    }
                }
            }
            con.rollback();
            return false;
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "Error during doctor registration", ex);
            try {
                con.rollback();
            } catch (SQLException e) {
                logger.log(Level.SEVERE, "Error rolling back transaction", e);
            }
            return false;
        } finally {
            try {
                con.setAutoCommit(true);
            } catch (SQLException e) {
                logger.log(Level.SEVERE, "Error resetting auto-commit", e);
            }
        }
    }

}
