/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.invoice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.utils.DBUtils;

/**
 *
 * @author nguye
 */
public class InvoiceDAO {

    private Connection connection;
    private PreparedStatement ps;
    ResultSet rs;

    public boolean invoiceExists(String InvID) throws SQLException {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT InvID FROM tblInvoice WHERE InvID = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {

                ps = conn.prepareStatement(sql);
                ps.setString(1, InvID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return false;
    }

    public boolean createInvoice(InvoiceDTO invoice) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO tblInvoice (InvID, UserID, DateBuy, PhoneNumber, Email, Total) VALUES (?, ?, ?, ?, ?, ?)";
        boolean response = false;

        try {
            connection = DBUtils.getConnection();
            if (connection != null) {
                ps = connection.prepareStatement(sql);
                ps.setString(1, invoice.getInvID());
                ps.setString(2, invoice.getUserID());
                ps.setString(3, invoice.getDateBuy());
                ps.setString(4, invoice.getPhoneNumber());
                ps.setString(5, invoice.getEmail());
                ps.setDouble(6, invoice.getTotal());
                response = ps.executeUpdate() > 0;
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return response;
    }
}
