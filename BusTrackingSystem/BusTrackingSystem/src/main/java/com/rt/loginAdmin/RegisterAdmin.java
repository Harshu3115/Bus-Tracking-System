package com.rt.loginAdmin;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegisterAdmin extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
        throws ServletException, IOException {

        
        // Get form parameters
        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        // Password confirmation check
        if (!password.equals(confirmPassword)) {
            req.setAttribute("errorMsg", "Passwords do not match!");
            RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
            rd.include(req, resp);
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to database
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/BusTracker", "root", "root"
            );

            // Prepare insert query
            ps = con.prepareStatement(
                "INSERT INTO adminregistration(fullname,email,phone,username,password) VALUES(?,?,?,?,?)"
            );
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, username);
            ps.setString(5, password); // For security, you can hash this later

            int row = ps.executeUpdate();

            // Forward to login page with message
            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
            if (row > 0) {
                req.setAttribute("successMsg", "Admin " + fullname + " added successfully!");
            } else {
                req.setAttribute("errorMsg", "Unable to add Admin " + fullname + "...");
            }
            rd.include(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMsg", "Error: " + e.getMessage());
            RequestDispatcher rd = req.getRequestDispatcher("registerAdmin.jsp");
            rd.include(req, resp);
        } finally {
            // Close resources
            try { if (ps != null) ps.close(); } catch (Exception ex) {}
            try { if (con != null) con.close(); } catch (Exception ex) {}
        }
    }
}
