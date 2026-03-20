package com.rt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateBusServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // 1️⃣ Read form values
        String id = req.getParameter("id");
        String busNumber = req.getParameter("bus_number");
        String route = req.getParameter("route");
        String driverName = req.getParameter("driver_name");
        String conductorName = req.getParameter("conductor_name");

        try {
            // 2️⃣ Load Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 3️⃣ Database Connection
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/bustrackingsystem",
                    "root",
                    "Harshad@3115");

            // 4️⃣ Update Query
            String sql = "UPDATE register_bus SET " +
                         "bus_number=?, route=?, driver_name=?, conductor_name=? " +
                         "WHERE id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, busNumber);
            ps.setString(2, route);
            ps.setString(3, driverName);
            ps.setString(4, conductorName);
            ps.setInt(5, Integer.parseInt(id));

            int result = ps.executeUpdate();

            // 5️⃣ Response
            if (result > 0) {
                resp.sendRedirect("main.jsp");
            } else {
                resp.getWriter().println("❌ No record found for ID: " + id);
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }
}
