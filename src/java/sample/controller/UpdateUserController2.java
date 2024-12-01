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
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.user.UserError;

/**
 *
 * @author nguye
 */
@WebServlet(name = "UpdateUserController2", urlPatterns = {"/UpdateUserController2"})
public class UpdateUserController2 extends HttpServlet {

    private static final String ERROR = "manager.jsp";
    private static final String SUCCESS = "manager.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        UserError userError = new UserError();
        try {
            String UserID = request.getParameter("UserID");
            String FullName = request.getParameter("FullName");
            String RoleID = request.getParameter("RoleID");
            String Password = request.getParameter("Password");
            String PhoneNumber = request.getParameter("PhoneNumber");
            String Email = request.getParameter("Email");

            UserDTO user = new UserDTO(UserID, FullName, RoleID, Password, PhoneNumber, Email);
            UserDAO dao = new UserDAO();

            boolean checkUpdate = dao.update(user);
            if (checkUpdate) {
                url = SUCCESS;
                request.setAttribute("message", "Update success!");
            } else {
                request.setAttribute("message", "Update fail!");
            }
        } catch (Exception e) {
            log("Error at updateUserController2: " + e.toString());
            e.printStackTrace();

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
