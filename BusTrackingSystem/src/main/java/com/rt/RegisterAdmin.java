package com.rt;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterAdmin extends HttpServlet {
	
	protected void service(HttpServletRequest req,HttpServletResponse resp)throws ServletException, IOException{
		 
		String fullname = req.getParameter("fullname");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bustrackingsystem","root", "Harshad@3115");
			PreparedStatement ps = con.prepareStatement("insert into registeradmin(fullname,email,phone,username,password) values(?,?,?,?,?)");
			ps.setString(1, fullname);
			ps.setString(2, email);
			ps.setString(3, phone);
			ps.setString(4, username);
			ps.setString(5, password);
			
			int rs = ps.executeUpdate();
			
            resp.sendRedirect("login.jsp");

        } catch(Exception e) {
            e.printStackTrace();
            resp.getWriter().println("Error: " + e.getMessage());
        } 
    }
}
