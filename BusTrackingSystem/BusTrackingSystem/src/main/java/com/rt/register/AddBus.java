package com.rt.register;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AddBus extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {
        
        String bus_number = request.getParameter("bus_number");
        String route = request.getParameter("route");
        String driver_name = request.getParameter("driver_name");
        String conductor_name = request.getParameter("conductor_name");
        String arrival_time = request.getParameter("arrival_time");
        String departure_time = request.getParameter("departure_time");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BusTracker", "root", "root");

            ps = con.prepareStatement("INSERT INTO bus_registration(bus_number,route,driver_name,conductor_name,arrival_time,departure_time) VALUES(?,?,?,?,?,?)");
            ps.setString(1, bus_number);
            ps.setString(2, route);
            ps.setString(3, driver_name);
            ps.setString(4, conductor_name);
            ps.setString(5, arrival_time);
            ps.setString(6, departure_time);

            int rs = ps.executeUpdate();

         
            
            
            if(rs > 0) {
                request.setAttribute("successMsg", "Student Registered Successfully!");
            } else {
                request.setAttribute("errorMsg", "Failed to Register Student!");
            }

            

            response.sendRedirect("main.jsp");
        } catch(Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try { if(ps!=null) ps.close(); if(con!=null) con.close(); } catch(Exception ex) {}
        }
    }
}
