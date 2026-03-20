package com.re.restPass;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ResetPass")
public class ResetPass extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String oldPassword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");

        

        if (!newPassword.equals(confirmPassword)) {
            resp.getWriter().println("<script>alert('New password and Confirm password do not match!'); window.history.back();</script>");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/BusTracker", "root", "root"
            );

            // Check old password
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM adminregistration WHERE username=? AND password=?"
            );
            ps.setString(1, username);
            ps.setString(2, oldPassword);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Update password
                PreparedStatement updatePs = con.prepareStatement(
                    "UPDATE adminregistration SET password=? WHERE username=?"
                );
                updatePs.setString(1, newPassword);
                updatePs.setString(2, username);

                int rows = updatePs.executeUpdate();

                if (rows > 0) {
                    resp.getWriter().println("<script>alert('Password updated successfully! Please login again.'); window.location='login.jsp';</script>");
                } else {
                    resp.getWriter().println("<script>alert('Failed to update password. Try again!'); window.history.back();</script>");
                }
                updatePs.close();
            } else {
                resp.getWriter().println("<script>alert('Invalid Username or Old Password!'); window.history.back();</script>");
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
