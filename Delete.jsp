<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Delete Bus Information</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: #f0f4f8;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .delete-container {
      max-width: 400px;
      margin: 8% auto;
      background: #fff;
      border-radius: 15px;
      box-shadow: 0px 6px 15px rgba(0,0,0,0.2);
      padding: 35px 30px;
      transition: transform 0.3s ease;
    }
    .delete-container:hover {
      transform: translateY(-5px);
    }
    .form-title {
      text-align: center;
      margin-bottom: 25px;
      font-size: 22px;
      font-weight: bold;
      color: #333;
    }
    .form-control {
      border-radius: 10px;
    }
    .btn-danger {
      width: 100%;
      border-radius: 10px;
      padding: 10px;
      font-size: 16px;
      font-weight: 500;
    }
  </style>
</head>
<body>

  <div class="delete-container">
    <h3 class="form-title">Delete Bus Information</h3>
    <form action="delete" method="post">
      <div class="mb-3">
        <label for="id" class="form-label">Enter Bus ID</label>
        <input type="text" id="id" name="id" class="form-control" placeholder="Enter Bus ID" required>
      </div>
      <button type="submit" class="btn btn-danger">Delete</button>
    </form>
  </div>
  <!-- Footer -->
<footer class="text-center mb-3 p-4" style="background: #2b7be9; color: white;  max-width: 100%; margin-top: 200px">
    <p>&copy; <%= java.time.Year.now() %> Bus Tracking System. All rights reserved.</p>
    <p>Designed & Developed by Your Company Name</p>
</footer>

</body>
</html>
