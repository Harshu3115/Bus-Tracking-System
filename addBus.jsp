<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Bus Registration</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      background: #f0f4f8;
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 20px;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    .register-container {
      max-width: 850px;
      width: 100%;
      background: white;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
      overflow: hidden;
      padding: 0;
    }
    
    .form-header {
      background: #4361ee;
      color: white;
      padding: 25px;
      text-align: center;
    }
    
    .form-title {
      font-weight: 700;
      margin-bottom: 5px;
      font-size: 28px;
    }
    
    .form-body {
      padding: 30px;
    }
    
    .form-row {
      display: flex;
      gap: 20px;
      margin-bottom: 20px;
      opacity: 0;
      transform: translateY(-20px);
      transition: all 0.5s ease;
    }
    
    .form-row.show {
      opacity: 1;
      transform: translateY(0);
    }
    
    .form-group {
      flex: 1;
      position: relative;
    }
    
    .form-label {
      font-weight: 500;
      color: #495057;
      margin-bottom: 8px;
      display: flex;
      align-items: center;
      gap: 8px;
    }

    /* Fixed border-radius fields */
    .input-group {
      display: flex;
      align-items: stretch;
    }

    .input-group-text {
      background: #f8f9fa;
      border: 2px solid #e9ecef;
      border-right: none;
      border-radius: 8px 0 0 8px !important;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 0 12px;
      color: #6c757d;
    }

    .input-group .form-control {
      border: 2px solid #e9ecef;
      border-left: none;
      border-radius: 0 8px 8px 0 !important;
      padding-left: 12px;
      transition: all 0.3s;
    }

    .input-group:focus-within .form-control,
    .input-group:focus-within .input-group-text {
      border-color: #4361ee;
      box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.15);
    }
    
    .btn-register {
      background: #4361ee;
      color: white;
      border: none;
      padding: 14px;
      font-weight: 600;
      border-radius: 8px;
      transition: all 0.3s;
      width: 100%;
      margin-top: 10px;
    }
    
    .btn-register:hover {
      background: #3a56d4;
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(67, 97, 238, 0.4);
    }
    
    .form-footer {
      padding: 20px 30px;
      background: #f8f9fa;
      text-align: center;
      border-top: 1px solid #e9ecef;
    }
    
    @media (max-width: 768px) {
      .form-row {
        flex-direction: column;
        gap: 15px;
      }
    }
  </style>
</head>
<body>

  <div class="register-container">
    <div class="form-header">
      <h3 class="form-title"><i class="fas fa-bus"></i> Bus Registration Form</h3>
    </div>
    <p style="color: green;">${successMsg}</p>
    <p style="color: red;">${errorMsg}</p>

    <form action="register_bus" method="post">
      <div class="form-body">
        <div class="form-row">
          <div class="form-group">
            <label for="busNumber" class="form-label"><i class="fas fa-hashtag"></i> Bus Number</label>
            <div class="input-group">
              <span class="input-group-text"><i class="fas fa-bus"></i></span>
              <input type="text" class="form-control" id="busNumber" name="bus_number" placeholder="Enter Bus Number" required>
            </div>
          </div>
          
          <div class="form-group">
            <label for="route" class="form-label"><i class="fas fa-route"></i> Route</label>
            <div class="input-group">
              <span class="input-group-text"><i class="fas fa-map-marked-alt"></i></span>
              <input type="text" class="form-control" id="route" name="route" placeholder="Enter Route" required>
            </div>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group">
            <label for="driverName" class="form-label"><i class="fas fa-id-card-alt"></i> D - Batch Number</label>
            <div class="input-group">
              <span class="input-group-text"><i class="fas fa-user"></i></span>
              <input type="text" class="form-control" id="driverName" name="driver_name" placeholder="Enter D - Batch Number" required>
            </div>
          </div>

          <div class="form-group">
            <label for="conductorName" class="form-label"><i class="fas fa-user-check"></i> C - Batch Number</label>
            <div class="input-group">
              <span class="input-group-text"><i class="fas fa-user"></i></span>
              <input type="text" class="form-control" id="conductorName" name="conductor_name" placeholder="Enter C - Batch Number" required>
            </div>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group">
            <label for="arrivalTime" class="form-label"><i class="fas fa-sign-in-alt"></i> Arrival Time</label>
            <div class="input-group">
              <span class="input-group-text"><i class="fas fa-clock"></i></span>
              <input type="time" class="form-control" id="arrivalTime" name="arrival_time" required>
            </div>
          </div>

          <div class="form-group">
            <label for="departureTime" class="form-label"><i class="fas fa-sign-out-alt"></i> Departure Time</label>
            <div class="input-group">
              <span class="input-group-text"><i class="fas fa-clock"></i></span>
              <input type="time" class="form-control" id="departureTime" name="departure_time" required>
            </div>
          </div>
        </div>

        <div class="form-row">
          <button type="submit" class="btn-register"><i class="fas fa-plus-circle"></i> Register Bus</button>
        </div>
      </div>
    </form>

    <div class="form-footer">
      <p class="mb-0 small text-muted">
        By registering, you agree to our <a href="#">Privacy Policy</a> & <a href="#">Terms</a>.
      </p>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    // Slide-down animation with stagger
    window.addEventListener('load', () => {
      const rows = document.querySelectorAll('.form-row');
      rows.forEach((row, index) => {
        setTimeout(() => {
          row.classList.add('show');
        }, index * 200);
      });
    });
    
    // Simple form validation for time
    document.addEventListener('DOMContentLoaded', function() {
      const form = document.querySelector('form');
      
      form.addEventListener('submit', function(e) {
        const arrivalTime = document.getElementById('arrivalTime').value;
        const departureTime = document.getElementById('departureTime').value;
        
        if (arrivalTime && departureTime && arrivalTime >= departureTime) {
          e.preventDefault();
          alert('Arrival time must be before departure time!');
        }
      });
    });
  </script>
</body>
</html>
