package com.rt;

import com.rt.model.Bus;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ViewAllBusServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Bus> busList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/bustrackingsystem",
                    "root",
                    "Harshad@3115");

            String sql = "SELECT * FROM register_bus";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Bus bus = new Bus();
                bus.setId(rs.getInt("id"));
                bus.setBusNumber(rs.getString("bus_number"));
                bus.setRoute(rs.getString("route"));
                bus.setDriverName(rs.getString("driver_name"));
                bus.setConductorName(rs.getString("conductor_name"));
                bus.setArrivalTime(rs.getString("arrival_time"));
                bus.setDepartureTime(rs.getString("departure_time"));
                busList.add(bus);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // ✅ Correct Forwarding
        req.setAttribute("busList", busList);
        req.getRequestDispatcher("viewAll.jsp").forward(req, resp);
    }
}
