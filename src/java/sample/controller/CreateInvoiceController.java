/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import sample.cart.CartDAO;
import sample.cart.CartDTO;
import sample.invoice.InvoiceDAO;
import sample.invoice.InvoiceDTO;

/**
 *
 * @author nguye
 */
@WebServlet(name = "CreateInvoiceController", urlPatterns = {"/CreateInvoiceController"})
public class CreateInvoiceController extends HttpServlet {

    private static final String ERROR = "checkout.jsp";
    private static final String SUCCESS = "thankyou.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        InvoiceDAO dao = new InvoiceDAO();
        try {
            String InvID = request.getParameter("InvID");
            String UserID = request.getParameter("UserID");
            String DateBuy = request.getParameter("DateBuy");

            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            DateBuy = formatter.format(date);
            String PhoneNumber = request.getParameter("PhoneNumber");
            String Email = request.getParameter("Email");
            double Total = Double.parseDouble(request.getParameter("Total"));

            InvoiceDTO invoice = new InvoiceDTO(InvID, UserID, DateBuy, PhoneNumber, Email, Total);
            boolean checkInsert = dao.createInvoice(invoice);
            if (checkInsert) {
                CartDAO cartDAO = new CartDAO();
                List<CartDTO> cartList = cartDAO.getCart(UserID);
                for (CartDTO cart : cartList) {
                    cartDAO.removeFromCart(cart.getCartID());
                }

                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at CreateInvoiceController: " + e.toString());
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
