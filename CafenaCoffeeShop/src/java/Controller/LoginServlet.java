/*
 *  To change this license header, choose License Headers in Project Properties.
 *  To change this template file, choose Tools | Templates
 *  and open the template in the editor.
 */
package Controller;

import Entity.Account;
import Model.AccountModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Asus
 */
public class LoginServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        doPost(request, response);
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
        try {
            HttpSession session = request.getSession();
            String action = request.getParameter("action");
            String rememberMe = request.getParameter("rememberMe");
            Account account = null;

            //Login for user, staff, admin
            if (action.equalsIgnoreCase("user") || action.equalsIgnoreCase("staff") || action.equalsIgnoreCase("admin")) {
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                account = AccountModel.getAccountByAccess(email, password, action);
                if (account == null) {
                    throw new Exception("Please check your email, password again");
                } else {
                    session.setAttribute("account", account);
                }

            } else if (action.equalsIgnoreCase("register")) { //Register 

            } else if (action.equalsIgnoreCase("logout")) { //Logout
                Cookie cookie = new Cookie("email", "");
                cookie.setMaxAge(0);
                response.addCookie(cookie);
                session.removeAttribute("account");
            } else {
                throw new Exception("Error in comfirming role");
            }
            if (rememberMe != null && account != null) { //Check remember me
                Cookie cookie = new Cookie("email", account.getEmail());
                cookie.setMaxAge(60 * 60 * 24);
                response.addCookie(cookie);
            }
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("error", ex);
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
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
