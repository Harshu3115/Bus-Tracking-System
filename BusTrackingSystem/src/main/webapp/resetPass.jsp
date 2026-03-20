<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password - Bus Tracking System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2b7be9;
            --secondary-color: #27ae60;
            --danger-color: #e74c3c;
            --light-bg: #f0f4f8;
        }
        
        body {
            background: var(--light-bg);
            font-family: 'Montserrat', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        
        .reset-container {
            max-width: 800px;
            width: 100%;
            padding: 30px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0px 6px 18px rgba(0,0,0,0.1);
            animation: fadeIn 0.5s ease;
        }
        
        .logo-container {
            text-align: center;
            margin-bottom: 30px;
        }
        
        .logo {
            color: var(--primary-color);
            font-size: 2.5rem;
            margin-bottom: 10px;
        }
        
        .reset-container h2 {
            text-align: center;
            font-weight: 700;
            margin-bottom: 30px;
            color: var(--primary-color);
        }
        
        .form-label {
            font-weight: 600;
            color: #555;
            margin-bottom: 0.5rem;
        }
        
        .input-group {
            position: relative;
        }
        
        .password-toggle {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #777;
            cursor: pointer;
            z-index: 5;
        }
        
        .password-strength {
            height: 5px;
            margin-top: 5px;
            border-radius: 5px;
            background: #eee;
            overflow: hidden;
        }
        
        .password-strength-bar {
            height: 100%;
            width: 0;
            transition: width 0.3s, background 0.3s;
            border-radius: 5px;
        }
        
        .requirements {
            font-size: 0.85rem;
            color: #666;
            margin-top: 5px;
        }
        
        .btn-custom {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            border: none;
            color: #fff;
            font-weight: 600;
            padding: 12px 25px;
            border-radius: 8px;
            transition: all 0.3s;
        }
        
        .btn-custom:hover {
            opacity: 0.9;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        
        .alert {
            border-radius: 8px;
            margin-top: 20px;
        }
        
        .footer {
            text-align: center;
            margin-top: 30px;
            color: #777;
            font-size: 0.9rem;
        }
        
        .footer a {
            color: var(--primary-color);
            text-decoration: none;
        }
        
        .horizontal-form .row {
            margin-bottom: 1.5rem;
            align-items: center;
        }
        
        .form-control {
            border-radius: 8px;
            padding: 10px 15px;
            height: 45px;
        }
        
        .action-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="reset-container">
        <div class="logo-container">
            <i class="fas fa-bus logo"></i>
            <h2>Bus Tracking System</h2>
        </div>
        
        <h2>Reset Password</h2>
        
        <form id="resetForm" action="ResetPass" method="post" class="horizontal-form">
    <div class="row mb-3">
        <label for="username" class="form-label col-md-3">Username</label>
        <div class="col-md-9">
            <input type="text" class="form-control" name="username" id="username" required>
        </div>
    </div>

    <div class="row mb-3">
        <label for="oldPassword" class="form-label col-md-3">Old Password</label>
        <div class="col-md-9">
            <input type="password" class="form-control" name="oldPassword" id="oldPassword" required>
        </div>
    </div>

    <div class="row mb-3">
        <label for="newPassword" class="form-label col-md-3">New Password</label>
        <div class="col-md-9">
            <input type="password" class="form-control" name="newPassword" id="newPassword" required>
        </div>
    </div>

    <div class="row mb-3">
        <label for="confirmPassword" class="form-label col-md-3">Confirm Password</label>
        <div class="col-md-9">
            <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" required>
        </div>
    </div>

    <div class="row">
        <div class="col-md-9 offset-md-3">
            <button type="submit" class="btn btn-custom">Update Password</button>
        </div>
    </div>
</form>


        <div class="alert alert-success mt-4" role="alert" id="successAlert" style="display: none;">
            <i class="fas fa-check-circle"></i> Password updated successfully!
        </div>
        
        <div class="alert alert-danger mt-4" role="alert" id="errorAlert" style="display: none;">
            <i class="fas fa-exclamation-circle"></i> <span id="errorMessage"></span>
        </div>

        <div class="footer">
            <p>Remember your password? <a href="login.jsp">Login here</a></p>
            <p>© 2023 Bus Tracking System. All rights reserved.</p>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Password visibility toggles
            const toggleOldPassword = document.getElementById('toggleOldPassword');
            const toggleNewPassword = document.getElementById('toggleNewPassword');
            const toggleConfirmPassword = document.getElementById('toggleConfirmPassword');
            const oldPassword = document.getElementById('oldPassword');
            const newPassword = document.getElementById('newPassword');
            const confirmPassword = document.getElementById('confirmPassword');
            
            toggleOldPassword.addEventListener('click', function() {
                togglePasswordVisibility(oldPassword, toggleOldPassword);
            });
            
            toggleNewPassword.addEventListener('click', function() {
                togglePasswordVisibility(newPassword, toggleNewPassword);
            });
            
            toggleConfirmPassword.addEventListener('click', function() {
                togglePasswordVisibility(confirmPassword, toggleConfirmPassword);
            });
            
            function togglePasswordVisibility(passwordField, toggleButton) {
                if (passwordField.type === 'password') {
                    passwordField.type = 'text';
                    toggleButton.innerHTML = '<i class="fas fa-eye-slash"></i>';
                } else {
                    passwordField.type = 'password';
                    toggleButton.innerHTML = '<i class="fas fa-eye"></i>';
                }
            }
            
            // Password strength indicator
            newPassword.addEventListener('input', function() {
                checkPasswordStrength(newPassword.value);
                checkPasswordMatch();
            });
            
            confirmPassword.addEventListener('input', checkPasswordMatch);
            
            function checkPasswordStrength(password) {
                const strengthBar = document.getElementById('passwordStrengthBar');
                let strength = 0;
                
                // Check password length
                if (password.length >= 8) strength += 20;
                
                // Check for uppercase letters
                if (password.match(/[A-Z]/)) strength += 20;
                
                // Check for lowercase letters
                if (password.match(/[a-z]/)) strength += 20;
                
                // Check for numbers
                if (password.match(/[0-9]/)) strength += 20;
                
                // Check for special characters
                if (password.match(/[^A-Za-z0-9]/)) strength += 20;
                
                // Update strength bar
                strengthBar.style.width = strength + '%';
                
                // Update color based on strength
                if (strength < 40) {
                    strengthBar.style.background = 'var(--danger-color)';
                } else if (strength < 80) {
                    strengthBar.style.background = '#f39c12';
                } else {
                    strengthBar.style.background = 'var(--secondary-color)';
                }
            }
            
            function checkPasswordMatch() {
                const matchElement = document.getElementById('passwordMatch');
                if (newPassword.value !== confirmPassword.value && confirmPassword.value !== '') {
                    matchElement.innerHTML = '<i class="fas fa-times-circle"></i> Passwords do not match';
                    matchElement.style.color = 'var(--danger-color)';
                } else if (confirmPassword.value !== '') {
                    matchElement.innerHTML = '<i class="fas fa-check-circle"></i> Passwords match';
                    matchElement.style.color = 'var(--secondary-color)';
                } else {
                    matchElement.innerHTML = '';
                }
            }
            
            // Form submission
            document.getElementById('resetForm').addEventListener('submit', function(e) {
                e.preventDefault();
                
                // Hide previous alerts
                document.getElementById('successAlert').style.display = 'none';
                document.getElementById('errorAlert').style.display = 'none';
                
                // Validate passwords match
                if (newPassword.value !== confirmPassword.value) {
                    showError('New password and confirm password do not match!');
                    return;
                }
                
                // Validate password strength
                if (newPassword.value.length < 8) {
                    showError('Password must be at least 8 characters long!');
                    return;
                }
                
                // Simulate successful password reset
                // In a real application, this would be an AJAX call to the server
                simulatePasswordReset();
            });
            
            function showError(message) {
                const errorAlert = document.getElementById('errorAlert');
                document.getElementById('errorMessage').textContent = message;
                errorAlert.style.display = 'block';
            }
            
            function showSuccess() {
                document.getElementById('successAlert').style.display = 'block';
            }
            
            function simulatePasswordReset() {
                // This is a simulation - in a real application, you would make an AJAX call to your JSP backend
                const username = document.getElementById('username').value;
                const oldPassword = document.getElementById('oldPassword').value;
                
                // Simulate server response after 1 second
                setTimeout(function() {
                    // For demo purposes, let's assume it's always successful
                    showSuccess();
                    
                    // Reset form
                    document.getElementById('resetForm').reset();
                    document.getElementById('passwordStrengthBar').style.width = '0';
                    document.getElementById('passwordMatch').innerHTML = '';
                }, 1000);
            }
        });
    </script>
</body>
</html>