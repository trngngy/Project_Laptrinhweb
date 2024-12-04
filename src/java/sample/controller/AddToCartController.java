/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.cart.CartDAO;
import sample.cart.CartDTO;
import sample.product.ProductDAO;
import sample.product.ProductDTO;

/**
 *
 * @author nguye
 */
@WebServlet(name = "AddToCartController", urlPatterns = {"/AddToCartController"})
public class AddToCartController extends HttpServlet {

    private static final String ERROR = "shop.jsp";
    private static final String SUCCESS = "shop.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url= ERROR;
    try {
        CartDAO dao = new CartDAO();
        String UserID = request.getParameter("UserID").trim();
        if (UserID == null || UserID.isEmpty()) {
            ProductDAO productDao = new ProductDAO();
            List<ProductDTO> productList = productDao.getAllProduct();
            request.setAttribute("Product_List", productList);
            request.setAttribute("message", "Please login to add product.");
            
     
        }else{
            
               
            
        int ProductID = Integer.parseInt(request.getParameter("ProductID"));
        double Price = Double.parseDouble(request.getParameter("Price"));
        String InvID = request.getParameter("InvID");        
        String ImageURL = request.getParameter("ImageURL");
        int Quantity = Integer.parseInt(request.getParameter("Quantity"));
        double TotalPrice = Price*Quantity;
        String CartID = "B" + new Random().nextInt(10000);
        
        // Check if the glasses already exist in the cart
        CartDTO existingCart = dao.getCartByProductID(ProductID,UserID);
        if (existingCart != null) {
            // If the glasses already exist in the cart, update the quantity
            existingCart.setQuantity(existingCart.getQuantity() + Quantity);
            existingCart.setTotalPrice(Price*existingCart.getQuantity());
            boolean check = dao.updateCart(existingCart);
            if (check) {
                request.setAttribute("message", "Updated quantity of item in cart successfully.");
            } else {
                request.setAttribute("message", "Failed to update quantity of item.");
            }
        } else {
            // If the glasses do not exist in the cart, add a new entry
           
            boolean check = dao.addToCart(CartID, ProductID, Price, TotalPrice, Quantity, ImageURL, UserID, InvID);
            if (check) {
                url = SUCCESS;
                request.setAttribute("message", "Add to cart successfully.");
            } else {
                request.setAttribute("message", "Failed to add to cart.");
            }
        }
        }
      

    } catch (Exception e) {
        log("Error at AddToCartController: "+ e.toString());
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
