/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

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
public class ProductDAO {

    Connection connection;
    PreparedStatement ps;
    ResultSet rs;

    public List<ProductDTO> getAllProduct() throws SQLException {
        List<ProductDTO> productList = new ArrayList<ProductDTO>();
        ProductDTO product;
        String sql = "SELECT * FROM tblProducts";
        try {
            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                product = new ProductDTO(
                        rs.getInt("ProductID"),
                        rs.getString("Model"),
                        rs.getDouble("Price"),
                        rs.getString("Color"),
                        rs.getString("ImageURL"),
                        rs.getInt("Status")
                );
                if (product.getStatus() == 1) {
                    productList.add(product);
                }
            }
        } catch (Exception e) {

        } finally {
            if (ps != null) {
                ps.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return productList;
    }

    public List<ProductDTO> getAllByPriceRange(double minPrice, double maxPrice) throws SQLException {
        List<ProductDTO> productList = new ArrayList<ProductDTO>();
        ProductDTO product;
        String sql = "SELECT * FROM tblProducts WHERE Price BETWEEN ? AND ?";
        try {
            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setDouble(1, minPrice);
            ps.setDouble(2, maxPrice);

            rs = ps.executeQuery();
            while (rs.next()) {
                product = new ProductDTO(
                        rs.getInt("ProductID"),
                        rs.getString("Model"),
                        rs.getDouble("Price"),
                        rs.getString("Color"),
                        rs.getString("ImageURL"),
                        rs.getInt("Status")
                );
                if (product.getStatus() == 1) {
                    productList.add(product);
                }
            }
        } catch (Exception ex) {

        } finally {
            if (ps != null) {
                ps.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
        return productList;
    }

    public List<ProductDTO> searchProductByModel(String model) throws SQLException {
        List<ProductDTO> productList = new ArrayList<ProductDTO>();
        ProductDTO product;
        String sql = "SELECT * FROM tblProducts WHERE Model LIKE ?";
        try {
            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + model + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                product = new ProductDTO(
                        rs.getInt("ProductID"),
                        rs.getString("Model"),
                        rs.getDouble("Price"),
                        rs.getString("Color"),
                        rs.getString("ImageURL"),
                        rs.getInt("Status")
                );
                if (product.getStatus() == 1) {
                    productList.add(product);
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
            if (connection != null) {
                connection.close();
            }
        }
        return productList;
    }

    public boolean updateProduct(ProductDTO product) throws ClassNotFoundException, SQLException {
        String sql = "UPDATE tblProducts SET Model = ?, Price = ?, Color = ?, ImageURL = ?, Status = ? WHERE ProductID = ?";
        boolean response = false;

        try {
            connection = DBUtils.getConnection();
            if (connection != null) {
                ps = connection.prepareStatement(sql);
                ps.setString(1, product.getModel());
                ps.setDouble(2, product.getPrice());
                ps.setString(3, product.getColor());
                ps.setString(4, product.getImageURL());
                ps.setInt(5, product.getStatus());
                ps.setInt(6, product.getProductID());
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

    public boolean deleteProduct(int ProductID) throws ClassNotFoundException, SQLException {
        String sql = "DELETE FROM tblProducts WHERE ProductID = ?";
        boolean response = false;

        try {
            connection = DBUtils.getConnection();
            if (connection != null) {
                ps = connection.prepareStatement(sql);
                ps.setInt(1, ProductID);
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

    public boolean createProduct(ProductDTO product) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO tblProducts (ProductID, Model, Price, Color, ImageURL, Status) VALUES (?, ?, ?, ?, ?, ?)";
        boolean response = false;

        try {
            connection = DBUtils.getConnection();
            if (connection != null) {
                ps = connection.prepareStatement(sql);
                ps.setInt(1, product.getProductID());
                ps.setString(2, product.getModel());
                ps.setDouble(3, product.getPrice());
                ps.setString(4, product.getColor());
                ps.setString(5, product.getImageURL());
                ps.setInt(6, product.getStatus());
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
