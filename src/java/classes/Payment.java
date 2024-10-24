/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;
import java.sql.*;
/**
 *
 * @author User
 */
public class Payment {
    private int payment_ID;
    private final int appointment_ID;
    private final String payment_method;
    private final String amount;

    public Payment(int appointment_ID, String payment_method, String amount) {
        this.appointment_ID = appointment_ID;
        this.payment_method = payment_method;
        this.amount = amount;
    }
    
    public boolean makePayment(Connection con) throws SQLException{
        String query = "INSERT INTO payment (appointment_ID, payment_method, amount) VALUES (?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        
        pstmt.setInt(1, this.appointment_ID);
        pstmt.setString(2, this.payment_method);
        pstmt.setString(3, this.amount);
        
    return pstmt.executeUpdate() > 0;
    }
}
