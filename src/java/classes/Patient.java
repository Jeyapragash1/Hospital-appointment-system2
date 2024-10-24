package classes;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Patient extends User {
    private String address;
    private static final Logger logger = Logger.getLogger(Patient.class.getName());

    public Patient() {
        super();
    }

    public Patient(String name, String email, String password, String phone_number, String dob, String address) {
        super(name, email, password, phone_number, dob, "PATIENT");
        this.address = address;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean registerPatient(Connection con) throws SQLException {
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
                        String insertPatientQuery = "INSERT INTO Patient (patient_ID, address) VALUES (?, ?)";
                        try (PreparedStatement patientStmt = con.prepareStatement(insertPatientQuery)) {
                            patientStmt.setInt(1, userId);
                            patientStmt.setString(2, this.address);
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
            logger.log(Level.SEVERE, "Error during patient registration", ex);
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

    public Patient getPatientById(Connection con) {
        super.getUserById(con);
        String query = "SELECT address FROM Patient WHERE patient_ID = ?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setInt(1, this.getId());
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    this.setAddress(rs.getString("address"));
                }
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error retrieving patient information", e);
        }
        return this;
    }

    public boolean updatePatient(Connection con) {
        String query = "UPDATE Patient SET address = ? WHERE patient_ID = ?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, this.address);
            pstmt.setInt(2, this.getId());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "Error updating patient information", ex);
            return false;
        }
    }
}