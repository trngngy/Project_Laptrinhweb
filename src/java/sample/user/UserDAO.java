/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

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
public class UserDAO {

    private static final String LOGIN = "SELECT * FROM tblUsers WHERE UserID = ? AND Password = ?";
    private static final String INSERT = "INSERT INTO tblUsers(UserID, FullName, RoleID, Password, PhoneNumber, Email) VALUES (?,?,?,?,?,?)";
    private static final String CHECK_DUPLICATE = "SELECT UserID FROM tblUsers WHERE UserID=?";
    private static final String UPDATE = "UPDATE tblUsers SET FullName=?, Password=?, PhoneNumber=?, Email=? WHERE UserID=?";
    private static final String DELETE = "DELETE tblUsers WHERE UserID=?";
    private static final String SEARCH = "SELECT * FROM tblUsers WHERE FullName LIKE ? ";

    public UserDTO checkLogin(String UserID, String Password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, UserID);
                ptm.setString(2, Password);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String FullName = rs.getString("FullName");
                    String RoleID = rs.getString("RoleID");
                    String PhoneNumber = rs.getString("PhoneNumber");
                    String Email = rs.getString("Email");
                    user = new UserDTO(UserID, FullName, RoleID, Password, PhoneNumber, Email);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return user;
    }

    public boolean insert(UserDTO User) throws ClassNotFoundException, SQLException {
        boolean checkInsert = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, User.getUserID());
                ptm.setString(2, User.getFullName());
                ptm.setString(3, User.getRoleID());
                ptm.setString(4, User.getPassword());
                ptm.setString(5, User.getPhoneNumber());
                ptm.setString(6, User.getEmail());
                checkInsert = ptm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return checkInsert;
    }

    public boolean checkDuplicate(String UserID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, UserID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean update(UserDTO User) throws SQLException {
        boolean checkUpdate = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, User.getFullName());
                ptm.setString(2, User.getPassword());
                ptm.setString(3, User.getPhoneNumber());
                ptm.setString(4, User.getEmail());
                ptm.setString(5, User.getUserID());
                checkUpdate = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return checkUpdate;
    }

    public List<UserDTO> getAllUsers() throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM tblUsers";
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String UserID = rs.getString("UserID");
                    String FullName = rs.getString("FullName");
                    String RoleID = rs.getString("RoleID");
                    String Password = rs.getString("Password");
                    String PhoneNumber = rs.getString("PhoneNumber");
                    String Email = rs.getString("Email");

                    list.add(new UserDTO(UserID, FullName, RoleID, Password, PhoneNumber, Email));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    public boolean delete(String UserID) throws SQLException {
        boolean checkDelete = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, UserID);
                checkDelete = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return checkDelete;
    }

    public List<UserDTO> getListUser(String search) throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String UserID = rs.getString("UserID");
                    String FullName = rs.getString("FullName");
                    String RoleID = rs.getString("RoleID");
                    String Password = rs.getString("Password");
                    String PhoneNumber = rs.getString("PhoneNumber");
                    String Email = rs.getString("Email");

                    list.add(new UserDTO(UserID, FullName, RoleID, Password, PhoneNumber, Email));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
}
