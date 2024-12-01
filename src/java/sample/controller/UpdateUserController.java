/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author nguye
 */
@WebServlet(name = "UpdateUserController", urlPatterns = {"/UpdateUserController"})
public class UpdateUserController extends HttpServlet {

    private static final String ERROR = "user.jsp";
    private static final String SUCCESS = "user.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO dao = new UserDAO();
        String url = ERROR;
        UserError error = new UserError();
        try {
            String UserID = request.getParameter("UserID");
            String FullName = request.getParameter("FullName");
            String RoleID = request.getParameter("RoleID");
            String Password = request.getParameter("Password");
            String PhoneNumber = request.getParameter("PhoneNumber");
            String Email = request.getParameter("Email");

            UserDTO user = new UserDTO(UserID, FullName, RoleID, Password, PhoneNumber, Email);
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser.getUserID().equals(UserID)) {
                loginUser.setFullName(FullName);
                loginUser.setPassword(Password);
                loginUser.setPhoneNumber(PhoneNumber);
                loginUser.setEmail(Email);
                session.setAttribute("LOGIN_USER", loginUser);
            }
            boolean checkUpdate = dao.update(user);
            if (checkUpdate) {
                url = SUCCESS;
                request.setAttribute("ERROR", "Update success!");
            } else {
                request.setAttribute("ERROR", "Update fail!");
            }
        } catch (Exception e) {
            log("Error at UpdateController: " + e.toString());
            if (e.toString().contains("Duplicate!!!")) {
                error.setUserID("Duplicate ID!");
                request.setAttribute("USER_ERROR", error);
            }
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
