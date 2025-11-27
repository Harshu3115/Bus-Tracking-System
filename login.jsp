<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Bus Tracking System — Login</title>

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
      overflow-x: hidden;
    }
    .login-card {
      max-width: 420px;
      margin: 0 auto;
      background: #fff;
      padding: 32px;
      border-radius: 14px;
      box-shadow: 0 8px 20px rgba(0,0,0,0.15);
      opacity: 0;
      transform: translateY(-50px);
      animation: slideDown 0.8s ease-out forwards;
    }
    .login-card h5 { font-weight: 700; margin-bottom: 20px; }
    .divider { height: 1px; background: linear-gradient(90deg, rgba(0,0,0,0.08), rgba(0,0,0,0.02)); margin: 20px 0; }
    @keyframes slideDown {
      from { opacity: 0; transform: translateY(-50px); }
      to { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>
<body>

  <div class="login-card">
    <h5>Log In</h5>

    <% 
      // Error message (wrong password)
      String errorMessage = (String) request.getAttribute("errorMessage");
      if (errorMessage != null) {
    %>
      <div class="alert alert-danger" role="alert">
          <i class="fas fa-exclamation-circle"></i> <%= errorMessage %>
      </div>
    <% } %>

    <% 
      // Success message (login successful)
      String successMessage = (String) session.getAttribute("successMessage");
      if (successMessage != null) {
    %>
      <div class="alert alert-success" role="alert">
          <i class="fas fa-check-circle"></i> <%= successMessage %>
      </div>
      <% session.removeAttribute("successMessage"); %>
    <% } %>

    <form action="LoginServlet" method="post">
      <div class="mb-3">
        <label for="username" class="form-label">Username or Email</label>
        <input type="text" class="form-control" id="username" name="username" placeholder="Enter username or email" required>
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
      </div>
      <div class="d-flex justify-content-between align-items-center mb-3">
        <div class="form-check">
          <input class="form-check-input" type="checkbox" id="rememberMe" name="remember" checked>
          <label class="form-check-label" for="rememberMe">Remember me</label>
        </div>
        <a href="resetPass.jsp" class="small">Forgot Password?</a>
      </div>
      <button type="submit" class="btn btn-success w-100">Sign In</button>
    </form>

    <div class="divider"></div>
    
    <p class="mb-3 text-center">New user? <a href="registerAdmin.jsp">Register Now</a></p>
    <p class="text-center small text-muted">
      By logging in, you agree to our <a href="#">Privacy Policy</a> & <a href="#">Cookie Policy</a>.
    </p>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

  <!-- Optional: JS Popup alert for success -->
  <%
    if (successMessage != null) {
  %>
    <script>
      alert("<%= successMessage %>");
    </script>
  <% } %>

</body>
</html>
