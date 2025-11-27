<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Bus Tracking System — Dashboard</title>

  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;500;700;800&display=swap" rel="stylesheet">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- Font Awesome Icons -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

  <style>
    body {
      font-family: "Montserrat", sans-serif;
      background: #f0f4f8;
      color: #111827;
      padding: 40px 15px;
    }

    .page-title {
      text-align: center;
      font-weight: 800;
      font-size: clamp(34px, 6vw, 56px);
      margin-bottom: 40px;
      background: linear-gradient(135deg, #2b7be9, #27ae60);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    .action-row {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 20px;
      margin-bottom: 40px;
    }

    .btn-lg-custom {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: .6rem;
      padding: 1rem 1.8rem;
      font-size: 1.1rem;
      font-weight: 600;
      border-radius: .8rem;
      box-shadow: 0 6px 18px rgba(16,24,40,0.08);
      color: white !important;
      text-decoration: none;
      transition: all .2s ease-in-out;
    }

    .btn-lg-custom:hover {
      transform: translateY(-3px);
      box-shadow: 0 12px 24px rgba(16,24,40,0.15);
    }

    .btn-add { background: linear-gradient(135deg, #2ecc71, #27ae60); }
    .btn-update { background: linear-gradient(135deg, #f39c12, #e67e22); }
    .btn-delete { background: linear-gradient(135deg, #e74c3c, #c0392b); }
    .btn-view { background: linear-gradient(135deg, #3498db, #2980b9); }
    .btn-logout { background: linear-gradient(135deg, #e74c3c, #c0392b); }

    .table-container {
      padding: 20px;
      border-radius: 10px;
      max-width: 1200px;
      margin: auto;
    }

    table { width: 100%; }
    
    
  </style>
</head>
<body>
<!-- <img alt="" src="2.jpg" class="img"> -->
<h1 class="page-title">Bus Tracking System</h1>

<!-- Action Buttons -->
<div class="action-row">
  <a href="addBus.jsp" class="btn-lg-custom btn-add"><i class="fa fa-plus"></i> Add Bus</a>
  <a href="update.jsp" class="btn-lg-custom btn-update"><i class="fa fa-pen"></i> Update Bus</a>
  <a href="Delete.jsp" class="btn-lg-custom btn-delete"><i class="fa fa-trash"></i> Delete Bus</a>
  <a href="viewAll.jsp" class="btn-lg-custom btn-view"><i class="fa fa-list"></i> View Buses</a>
  <a href=logout class="btn-lg-custom btn-logout"><i class="fa fa-sign-out-alt"></i> Logout</a>
</div>

<div class="table-container">
    <h3 class="mb-4 text-center">All Buses</h3>
    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle text-center">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Bus Number</th>
                    <th>Route</th>
                    <th>D - Batch Number</th>
                    <th>C - Batch Number</th>
                    <th>Arrival Time</th>
                    <th>Departure Time</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BusTracker","root","root");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM bus_registration");

                    while(rs.next()){
            %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("bus_number") %></td>
                    <td><%= rs.getString("route") %></td>
                    <td><%= rs.getString("driver_name") %></td>
                    <td><%= rs.getString("conductor_name") %></td>
                    <td><%= rs.getString("arrival_time") %></td>
                    <td><%= rs.getString("departure_time") %></td>
                    
                    <td>
                        <a href="update.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-primary me-1">
                            <i class="fa fa-pen"></i> Update
                        </a>
                        <a href="delete.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-danger"
                           onclick="return confirm('Are you sure you want to delete this bus?');">
                            <i class="fa fa-trash"></i> Delete
                        </a>
                    </td>
                </tr>
            <%
                    }
                    rs.close();
                    st.close();
                    con.close();
                } catch(Exception e) {
                    out.println("<tr><td colspan='6' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<!-- Footer -->
<footer class="text-center mt-5 p-4" style="background: #2b7be9; color: white;  max-width: 100%; ">
    <p>&copy; <%= java.time.Year.now() %> Bus Tracking System. All rights reserved.</p>
    <p>Designed & Developed by Your Company Name</p>
</footer>


<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
