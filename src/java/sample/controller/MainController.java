/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.MultipartConfig;

/**
 *
 * @author nguye
 */
@MultipartConfig
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";

    private static final String CREATE = "Sign Up";
    private static final String CREATE_CONTROLLER = "CreateController";

    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";

    private static final String UPDATEUSER = "Update User";
    private static final String UPDATEUSER_CONTROLLER = "UpdateUserController";

    private static final String UPDATEUSER2 = "Update User2";
    private static final String UPDATEUSER2_CONTROLLER = "UpdateUserController2";

    private static final String SEARCHPrice = "SearchPrice";
    private static final String SEARCHPrice_CONTROLLER = "SearchPriceController";

    private static final String SEARCHModel = "SearchModel";
    private static final String SEARCHModel_CONTROLLER = "SearchModelController";

    private static final String UPDATE = "UpdateProduct";
    private static final String UPDATE_CONTROLLER = "UpdateProductController";

    private static final String DELETE_PRODUCT = "DeleteProduct";
    private static final String DELETE_CONTROLLER = "DeleteProductController";

    private static final String CREATEPRODUCT = "Create";
    private static final String CREATEPRODUCT_CONTROLLER = "CreateProductController";

    private static final String DELETE_USER = "DeleteUser";
    private static final String DELETEUSER_CONTROLLER = "DeleteUserController";

    private static final String SEARCH_USER = "SearchUser";
    private static final String SEARCHUSER_CONTROLLER = "SearchUserController";

    private static final String ADDTOCART = "Add";
    private static final String ADDTOCART_CONTROLLER = "AddToCartController";

    private static final String CHANGECART = "Change";
    private static final String CHANGECONTROLLER = "ChangeController";
    
    private static final String REMOVECART = "Remove";
    private static final String REMOVECONTROLLER = "RemoveController";
    
    private static final String CREATEINVOICE = "CreateInvoice";
    private static final String CREATEINVOICE_CONTROLLER = "CreateInvoiceController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (CREATE.equals(action)) {
                url = CREATE_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (UPDATEUSER.equals(action)) {
                url = UPDATEUSER_CONTROLLER;
            } else if (SEARCHPrice.equals(action)) {
                url = SEARCHPrice_CONTROLLER;
            } else if (SEARCHModel.equals(action)) {
                url = SEARCHModel_CONTROLLER;
            } else if (UPDATE.equals(action)) {
                url = UPDATE_CONTROLLER;
            } else if (DELETE_PRODUCT.equals(action)) {
                url = DELETE_CONTROLLER;
            } else if (CREATEPRODUCT.equals(action)) {
                url = CREATEPRODUCT_CONTROLLER;
            } else if (DELETE_USER.equals(action)) {
                url = DELETEUSER_CONTROLLER;
            } else if (UPDATEUSER2.equals(action)) {
                url = UPDATEUSER2_CONTROLLER;
            } else if (SEARCH_USER.equals(action)) {
                url = SEARCHUSER_CONTROLLER;
            } else if (ADDTOCART.equals(action)) {
                url = ADDTOCART_CONTROLLER;
            } else if (CHANGECART.equals(action)) {
                url = CHANGECONTROLLER;
            } else if (REMOVECART.equals(action)) {
                url = REMOVECONTROLLER;
            } else if (CREATEINVOICE.equals(action)){
                url = CREATEINVOICE_CONTROLLER;
            }
            }catch (Exception e) {
            log("Error at MainController: " + e.toString());
        }finally {
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
