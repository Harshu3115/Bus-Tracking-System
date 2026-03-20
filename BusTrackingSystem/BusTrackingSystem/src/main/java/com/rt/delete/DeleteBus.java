package com.rt.delete;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteBus extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	    int id = Integer.parseInt(req.getParameter("id")); // Corrected

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");

	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BusTracker", "root", "root");
	        PreparedStatement ps = con.prepareStatement(
	            "delete from bus_registration WHERE id = ?" // Fixed query
	        );

	       
	        ps.setInt(1, id);

	        int rs = ps.executeUpdate();
	        resp.sendRedirect("Delete.jsp");

	        if (rs > 0) {
	            System.out.println("Deleted successfully...");
	        } else {
	            System.out.println("Deleted failed...");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

		
	
	
	}
