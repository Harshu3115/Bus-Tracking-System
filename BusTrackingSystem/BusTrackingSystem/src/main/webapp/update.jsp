<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Update Bus Information</title>
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
    
    .input-group {
      position: relative;
    }
    
    .input-group-text {
      position: absolute;
      left: 12px;
      top: 50%;
      transform: translateY(-50%);
      background: transparent;
      border: none;
      z-index: 5;
      color: #6c757d;
    }
    
    .form-control {
      width: 100%;
      padding: 12px 15px 12px 45px;
      border: 2px solid #e9ecef;
      border-radius: 8px;
      transition: all 0.3s;
    }
    
    .form-control:focus {
      border-color: #4361ee;
      box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.15);
    }
    
    .btn-update {
      background: #28a745;
      color: white;
      border: none;
      padding: 14px;
      font-weight: 600;
      border-radius: 8px;
      transition: all 0.3s;
      width: 100%;
      margin-top: 10px;
    }
    
    .btn-update:hover {
      background: #218838;
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(40, 167, 69, 0.4);
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
      <h3 class="form-title"><i class="fas fa-bus"></i> Update Bus Information</h3>
    </div>

    <form action="update" method="post">
      <div class="form-body">
        <div class="form-row">
          <div class="form-group">
            <label for="id" class="form-label"><i class="fas fa-key"></i> ID</label>
            <div class="input-group">
              <span class="input-group-text"><i class="fas fa-key"></i></span>
              <input type="text" class="form-control" id="id" name="id" placeholder="Enter ID you want to edit" required>
            </div>
          </div>
          
          <div class="form-group">
            <label for="busNumber" class="form-label"><i class="fas fa-hashtag"></i> Bus Number</label>
            <div class="input-group">
              <span class="input-group-text"><i class="fas fa-bus"></i></span>
              <input type="text" class="form-control" id="busNumber" name="bus_number" placeholder="Enter Bus Number" required>
            </div>
          </div>
        </div>

        <div class="form-row">
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
          <button type="submit" class="btn-update"><i class="fas fa-sync-alt"></i> Update Bus</button>
        </div>
      </div>
    </form>
    
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
  </script>
</body>
</html>