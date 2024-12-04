/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.utils.DBUtils;

/**
 *
 * @author nguye
 */
public class CartDAO {

    private Connection connection;
    private PreparedStatement ps;
    ResultSet rs;

    public boolean addToCart(String CartID, int ProductID, double Price, double TotalPrice, int Quantity, String ImageURL, String UserID, String InvID) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO tblCart (CartID, ProductID, Price, TotalPrice, Quantity, ImageURL, UserID, InvID) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        boolean response = false;
        try {
            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(sql);

            ps.setString(1, CartID);
            ps.setInt(2, ProductID);
            ps.setDouble(3, Price);
            ps.setDouble(4, TotalPrice);
            ps.setInt(5, Quantity);
            ps.setString(6, ImageURL);
            ps.setString(7, UserID);
            ps.setString(8, InvID);
            response = ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
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

    public List<CartDTO> getCart(String UserID) throws SQLException {
        List<CartDTO> cartList = new ArrayList<CartDTO>();
        CartDTO cart;
        String sql = "SELECT * FROM tblCart WHERE UserID = ?";
        try {
            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, UserID); // Set the userID parameter
            rs = ps.executeQuery();
            while (rs.next()) {
                cart = new CartDTO(
                        rs.getString("CartID"),
                        rs.getInt("ProductID"),
                        rs.getString("InvID"),
                        rs.getString("UserID"),
                        rs.getString("ImageURL"),
                        rs.getDouble("Price"),
                        rs.getDouble("TotalPrice"),
                        rs.getInt("Quantity"));
                cartList.add(cart);
            }
        } catch (Exception ex) {
            // Handle your exception here
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return cartList;
    }

    public CartDTO getCartByProductID(int ProductID, String UserID) throws ClassNotFoundException {
        String sql = "SELECT * FROM tblCart WHERE ProductID = ? and UserID =?;";
        CartDTO cart = null;
        try {
            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, ProductID);
            ps.setString(2, UserID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String CartID = rs.getString("CartID");
                String InvID = rs.getString("InvID");
                double Price = rs.getDouble("Price");
                double TotalPrice = rs.getDouble("TotalPrice");
                int Quantity = rs.getInt("Quantity");
                String ImageURL = rs.getString("ImageURL");
                cart = new CartDTO(CartID, ProductID, InvID, UserID, ImageURL, Price, TotalPrice, Quantity);
            }
        } catch (SQLException ex) {
            // Handle your exception here
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                // Handle your exception here
            }
        }
        return cart;
    }

    public boolean updateCart(CartDTO cart) throws ClassNotFoundException {
        String sql = "UPDATE tblCart SET TotalPrice = ?, Quantity = ? WHERE CartID = ?;";
        boolean response = false;
        try {
            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(sql);

            ps.setDouble(1, cart.getPrice() * cart.getQuantity()); // Set totalPrice
            ps.setInt(2, cart.getQuantity()); // Set quantity
            ps.setString(3, cart.getCartID()); // Set cartId

            response = ps.executeUpdate() > 0;
        } catch (SQLException ex) {
            // Handle your exception here
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                // Handle your exception here
            }
        }
        return response;
    }

    public void updateInvID(CartDTO cart) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE tblCart SET InvID = ? WHERE CartID = ?";
        connection = DBUtils.getConnection();
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, cart.getInvID());
        ps.setString(2, cart.getCartID());
        ps.executeUpdate();
    }

    public CartDTO getCartById(String CartID) throws ClassNotFoundException {
        String sql = "SELECT * FROM tblCart WHERE CartID = ?";
        CartDTO cart = null;
        try {
            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, CartID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int ProductID = rs.getInt("ProductID");
                String UserID = rs.getString("UserID");
                String InvID = rs.getString("InvID");
                double Price = rs.getDouble("Price");
                double TotalPrice = rs.getDouble("TotalPrice");
                int Quantity = rs.getInt("Quantity");
                String ImageURL = rs.getString("ImageURL");
                cart = new CartDTO(CartID, ProductID, InvID, UserID, ImageURL, Price, TotalPrice, Quantity);
            }
        } catch (SQLException ex) {
            // Handle your exception here
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                // Handle your exception here
            }
        }
        return cart;
    }
    public boolean removeFromCart(String CartID) {
        String sql = "DELETE FROM tblCart WHERE CartID = ?";
        boolean response = true;
        try {
            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, CartID);
            response = ps.executeUpdate() > 0 ? true : false;
        } catch (Exception ex) {
        }
        return response;
    }
}
