package classes;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class User {

    private int id;
    private String name;
    private String email;
    private String password;
    private String phone_number;
    private String dob;
    private String role;
    private String auth_key;

    private static final Logger logger = Logger.getLogger(User.class.getName());

    public User(String name, String email, String password, String phone_number, String dob, String role) {
        this.name = name;
        this.email = email;
        this.password = MD5.getMd5(password);
        this.phone_number = phone_number;
        this.dob = dob;
        this.role = role;
    }

    public User() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getAuth_key() {
        return auth_key;
    }

    public void setAuth_key(String auth_key) {
        this.auth_key = auth_key;
    }

    public boolean register(Connection con) {
        String query = "INSERT INTO user (name, email, password, role, phone_number, DOB) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, this.name);
            pstmt.setString(2, this.email);
            pstmt.setString(3, this.password);
            pstmt.setString(4, this.role);
            pstmt.setString(5, this.phone_number);
            pstmt.setString(6, this.dob);

            return pstmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "Error during user registration", ex);
            return false;
        }
    }

    private void updateAuthKey(Connection con) {
        String query = "UPDATE user SET auth_key = ? WHERE user_ID = ?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, this.auth_key);
            pstmt.setInt(2, this.id);
            pstmt.executeUpdate();
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "Error updating auth key", ex);
        }
    }

    public boolean authenticateByCredentials(Connection con) {
        String query = "SELECT user_ID, password, role FROM user WHERE email = ?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, this.email);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next() && rs.getString("password").equals(MD5.getMd5(this.password))) {
                    this.setId(rs.getInt("user_ID"));
                    this.setRole(rs.getString("role"));
                    this.setAuth_key(MD5.generateRandomToken(16));
                    updateAuthKey(con);
                    return true;
                }
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error during credential authentication", e);
        }
        return false;
    }

    public boolean authenticateByCookie(Connection con) {
        String query = "SELECT user_ID, role FROM user WHERE auth_key = ?";
        try (PreparedStatement pstmt = con.prepareStatement(query)) {
            pstmt.setString(1, this.auth_key);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    this.setId(rs.getInt("user_ID"));
                    this.setRole(rs.getString("role"));
                    this.setAuth_key(MD5.generateRandomToken(16));
                    updateAuthKey(con);
                    return true;
                }
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error during cookie authentication", e);
        }
        return false;
    }

    public User getUserById(Connection con) {
        try {
            String query = "SELECT name, role FROM user WHERE user_ID = ? ";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, this.id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                this.setName(rs.getString("name"));
                this.setRole(rs.getString("role"));

            }
        } catch (SQLException e) {
            Logger.getLogger(User.class
                    .getName()).log(Level.SEVERE, null, e);
        }
        return this;
    }
}
