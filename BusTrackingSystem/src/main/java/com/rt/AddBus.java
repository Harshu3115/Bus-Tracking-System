package com.rt;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddBus extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // 1️⃣ Read form values
        String busNumber = req.getParameter("bus_number");
        String route = req.getParameter("route");
        String driverName = req.getParameter("driver_name");
        String conductorName = req.getParameter("conductor_name");
        String arrivalTime = req.getParameter("arrival_time");
        String departureTime = req.getParameter("departure_time");

        try {
            // 2️⃣ Load JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 3️⃣ Database Connection
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/bustrackingsystem",
                    "root",
                    "Harshad@3115");

            // 4️⃣ SQL Query
            String sql = "INSERT INTO register_bus " +
                         "(bus_number, route, driver_name, conductor_name, arrival_time, departure_time) " +
                         "VALUES (?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, busNumber);
            ps.setString(2, route);
            ps.setString(3, driverName);
            ps.setString(4, conductorName);
            ps.setString(5, arrivalTime);
            ps.setString(6, departureTime);

            int result = ps.executeUpdate();

            // 5️⃣ Success Redirect
            if (result > 0) {
                resp.sendRedirect("main.jsp");
            } else {
                resp.getWriter().println("Bus registration failed ❌");
            }

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error: " + e.getMessage());
        }
    }
}
