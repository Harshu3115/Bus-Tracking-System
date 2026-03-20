package com.rt.update;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateBus extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String bus_number = req.getParameter("bus_number");
        String route = req.getParameter("route");
        String driver_name = req.getParameter("driver_name");
        String conductor_name = req.getParameter("conductor_name");
        String arrival_time = req.getParameter("arrival_time");
        String departure_time = req.getParameter("departure_time");
        int id = Integer.parseInt(req.getParameter("id"));

        

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BusTracker", "root", "root");
                 PreparedStatement ps = con.prepareStatement(
                     "UPDATE bus_registration SET bus_number=?, route=?, driver_name=?, conductor_name=? WHERE id=?")) {

                ps.setString(1, bus_number);
                ps.setString(2, route);
                ps.setString(3, driver_name);
                ps.setString(4, conductor_name);
                ps.setInt(5, id);

                int rs = ps.executeUpdate();

                if (rs > 0) {
                    resp.getWriter().println("<h3>Bus details updated successfully!</h3>");
                } else {
                    resp.getWriter().println("<h3>Update failed. No record found for ID: " + id + "</h3>");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
    }
}
