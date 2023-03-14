/*
 *  To change this license header, choose License Headers in Project Properties.
 *  To change this template file, choose Tools | Templates
 *  and open the template in the editor.
 */
package Controller;

import Entity.Account;
import Entity.Cart;
import Entity.Drink;
import Model.CartModel;
import Model.DrinkModel;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Asus
 */
public class ModifyCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            if (account == null) {
                request.setAttribute("error", "Please login to show your cart");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else {
                String action = request.getParameter("action");
                if (action.equalsIgnoreCase("add")) {
                    String emmail = account.getEmail();
                    int drinkID = Integer.parseInt(request.getParameter("drinkID"));
                    int amount = Integer.parseInt(request.getParameter("amount"));
                    ArrayList<Cart> carts = CartModel.getCartsByEmail(emmail);
                    boolean change = false;
                    for (Cart cart : carts) {
                        if (cart.getDrinkID() == drinkID) {
                            int newAmount = cart.getAmount() + amount;
                            CartModel.updateCartByEmail(emmail, drinkID, newAmount);
                            change = true;
                        }
                    }
                    if (!change) {
                        CartModel.addCartByEmail(emmail, drinkID, amount);
                    }
                    request.getRequestDispatcher("MenuServlet").forward(request, response);
                }
            }
        } catch (Exception ex) {
            request.setAttribute("error", ex);
            request.getRequestDispatcher("Error.jsp").forward(request, response);
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
