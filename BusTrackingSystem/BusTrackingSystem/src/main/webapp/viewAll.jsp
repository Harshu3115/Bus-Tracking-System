<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View All Buses</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2b7be9;
            --secondary-color: #f8f9fa;
            --accent-color: #6c757d;
            --text-dark: #343a40;
            --text-light: #f8f9fa;
            --success-color: #28a745;
            --danger-color: #dc3545;
            --warning-color: #ffc107;
        }
        
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #dbdbdb 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: var(--text-dark);
        }
        
        .container {
            padding-bottom: 50px;
        }
        
        .header {
            color: white;
            padding: 20px 0;
            margin-bottom: 30px;
        }
        
        .page-title {
            font-weight: 700;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
        }
        
        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
        }
        
        .table-container {
            background: white;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
        }
        
        .table thead th {
            background: black;
            color: white;
            border: none;
            padding: 15px 10px;
            font-weight: 600;
        }
        
        .table tbody td {
            padding: 12px 10px;
            vertical-align: middle;
        }
        
        .table tbody tr {
            transition: background-color 0.2s;
        }
        
        .table tbody tr:hover {
            background-color: rgba(43, 123, 233, 0.05);
        }
        
        .btn-primary {
            background-color: green;
            border: none;
            border-radius: 6px;
            padding: 8px 16px;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .btn-primary:hover {
            background-color: #1c68d8;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .btn-danger {
            background-color: var(--danger-color);
            border: none;
            border-radius: 6px;
            padding: 8px 16px;
            font-weight: 500;
            transition: all 0.3s;
        }
        
        .btn-danger:hover {
            background-color: #bd2130;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        .btn-sm {
            padding: 5px 10px;
            font-size: 0.875rem;
        }
        
        .action-buttons {
            white-space: nowrap;
        }
        
        footer {
            background: var(--primary-color);
            color: white;
            margin-top: 100px;
        }
        
        .search-box {
            max-width: 300px;
            margin-left: auto;
        }
        
        .no-buses {
            text-align: center;
            padding: 40px;
            color: var(--accent-color);
        }
        
        .no-buses i {
            font-size: 3rem;
            margin-bottom: 15px;
            color: var(--accent-color);
        }
        
        .foot {
            margin-top: 50px;
        }
        
        /* ✅ Center carousel text horizontally */
        .carousel-caption {
            left: 50%;
            transform: translateX(-50%);
            text-align: center;
            bottom: 20px; /* stays at bottom */
        }
        
        @media (max-width: 768px) {
            .table-container {
                overflow-x: auto;
            }
            
            .search-box {
                max-width: 100%;
                margin: 15px 0;
            }
            
            .action-buttons {
                display: flex;
                flex-direction: column;
                gap: 5px;
            }
            
            .action-buttons a {
                margin: 2px 0;
            }
        }
    </style>
</head>
<body>

<div id="carouselExampleCaptions" class="carousel slide">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="1.jpeg" class="d-block w-100 mt-3" alt="...">
      <div class="carousel-caption d-none d-md-block">
        <div class="header text-center mt-3">
            <h1 class="page-title"><i class="fas fa-bus me-2"></i>All Registered Buses</h1>
            <p class="lead mb-0">Manage your fleet efficiently</p>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="container">
    <!-- Action Buttons -->
    <div class="d-flex justify-content-between align-items-center mb-4 mt-3 flex-wrap">
        <a href="main.jsp" class="btn btn-primary">
            <i class="fas fa-home me-2"></i> Back to Home
        </a>
    </div>

    <!-- Buses Table -->
    <div class="table-container">
        <table class="table table-hover mb-0" id="busesTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Bus Number</th>
                    <th>Route</th>
                    <th>Driver</th>
                    <th>Conductor</th>
                    <th>Arrival Time</th>
                    <th>Departure Time</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
            <%
                Connection con = null;
                Statement st = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BusTracker", "root", "root");
                    st = con.createStatement();
                    rs = st.executeQuery("SELECT * FROM bus_registration");

                    boolean hasRecords = false;
                    
                    while (rs.next()) {
                        hasRecords = true;
            %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><strong><%= rs.getString("bus_number") %></strong></td>
                    <td><%= rs.getString("route") %></td>
                    <td><%= rs.getString("driver_name") %></td>
                    <td><%= rs.getString("conductor_name") %></td>
                    <td><span class="badge bg-light text-dark"><i class="fas fa-clock me-1"></i><%= rs.getString("arrival_time") %></span></td>
                    <td><span class="badge bg-light text-dark"><i class="fas fa-clock me-1"></i><%= rs.getString("departure_time") %></span></td>
                    
                    <td class="action-buttons">
                        <a href="update.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-primary me-1">
                            <i class="fas fa-edit me-1"></i> Edit
                        </a>
                        <a href="delete.jsp?id=<%= rs.getInt("id") %>" class="btn btn-sm btn-danger"
                           onclick="return confirm('Are you sure you want to delete this bus? This action cannot be undone.');">
                            <i class="fas fa-trash me-1"></i> Delete
                        </a>
                    </td>
                </tr>
            <%
                    }
                    
                    if (!hasRecords) {
            %>
                <tr>
                    <td colspan="9">
                        <div class="no-buses">
                            <i class="fas fa-bus-slash"></i>
                            <h4>No Buses Registered</h4>
                            <p>Get started by adding your first bus to the system.</p>
                            <a href="add_bus.jsp" class="btn btn-primary mt-2">
                                <i class="fas fa-plus-circle me-2"></i> Add New Bus
                            </a>
                        </div>
                    </td>
                </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='9' class='text-center text-danger p-4'><i class='fas fa-exclamation-circle me-2'></i>Error: " + e.getMessage() + "</td></tr>");
                } finally {
                    try { if (rs != null) rs.close(); } catch(Exception e) {}
                    try { if (st != null) st.close(); } catch(Exception e) {}
                    try { if (con != null) con.close(); } catch(Exception e) {}
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<!-- Footer -->
<footer class="text-center">
    <div class="container foot">
        <p class="mb-1">&copy; <%= java.time.Year.now() %> Bus Tracking System. All rights reserved.</p>
        <p class="mb-0">Designed & Developed by Transport Solutions Inc.</p>
    </div>
</footer>

<script>
    // Simple search functionality
    document.getElementById('searchInput')?.addEventListener('keyup', function() {
        const searchText = this.value.toLowerCase();
        const table = document.getElementById('busesTable');
        const rows = table.getElementsByTagName('tr');
        
        for (let i = 1; i < rows.length; i++) {
            const row = rows[i];
            let found = false;
            
            for (let j = 0; j < row.cells.length; j++) {
                const cellText = row.cells[j].textContent.toLowerCase();
                if (cellText.includes(searchText)) {
                    found = true;
                    break;
                }
            }
            
            row.style.display = found ? '' : 'none';
        }
    });
</script>

</body>
</html>
