<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Registration</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            display: flex;
            min-height: 100vh;
            justify-content: center;
            align-items: center;
            
      background: #f0f4f8;
            padding: 20px;
        }

        .container {
            background: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.15);
            width: 900px;
            max-width: 95%;
            text-align: center;
            animation: fadeIn 0.5s ease;
        }

        @keyframes slideDown {
      from {
        opacity: 0;
        transform: translateY(-50px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

        h2 {
            margin-bottom: 30px;
            color: #333;
            font-size: 28px;
            position: relative;
            padding-bottom: 10px;
        }

        h2:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 4px;
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
            border-radius: 2px;
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
            display: flex;
            flex-direction: column;
            text-align: left;
            position: relative;
        }

        .form-group i {
            position: absolute;
            left: 15px;
            top: 40px;
            color: #666;
            font-size: 18px;
        }

        label {
            font-weight: 500;
            color: #555;
            margin-bottom: 8px;
        }

        input {
            width: 100%;
            padding: 14px 14px 14px 45px;
            border: 1px solid #ddd;
            border-radius: 8px;
            outline: none;
            font-size: 16px;
            transition: all 0.3s;
        }

        input:focus {
            border-color: #4facfe;
            box-shadow: 0px 0px 8px rgba(79, 172, 254, 0.6);
        }

        input:focus + i {
            color: #4facfe;
        }

        .full-width-btn {
            width: 100%;
            padding: 16px;
            background: linear-gradient(to right, #2980b9, #1f6391);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }

        .full-width-btn:hover {
            background: linear-gradient(to right, #1f6391, #164a70);
            transform: translateY(-2px);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
        }

        .full-width-btn:active {
            transform: translateY(0);
        }

        .message {
            margin-top: 15px;
            padding: 10px;
            border-radius: 8px;
            font-weight: 500;
            text-align: center;
        }


        @media (max-width: 768px) {
            .form-row {
                flex-direction: column;
                gap: 15px;
            }
            
            .container {
                padding: 30px 20px;
            }
            
            input {
                padding: 12px 12px 12px 40px;
            }
            
            .form-group i {
                left: 12px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register Admin</h2>
        <form action="RegisterAdmin" method="post">
            <div class="form-row">
                <div class="form-group">
                    <label for="fullname">Full Name</label>
                    <input type="text" name="fullname" id="fullname" placeholder="Full Name" required>
                    <i class="fas fa-user"></i>
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" placeholder="Email Address" required>
                    <i class="fas fa-envelope"></i>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="text" name="phone" id="phone" placeholder="Phone Number (10 digits)" pattern="[0-9]{10}" required>
                    <i class="fas fa-phone"></i>
                </div>

                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" name="username" id="username" placeholder="Username" required>
                    <i class="fas fa-user-circle"></i>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" placeholder="Password" required>
                    <i class="fas fa-lock"></i>
                </div>

                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password" required>
                    <i class="fas fa-lock"></i>
                </div>
            </div>

            <div class="form-row">
                <button type="submit" class="full-width-btn">
                    <i class="fas fa-user-plus"></i> Register Admin
                </button>
            </div>

            <!-- Messages -->
            <div class="message success">${successMsg}</div>
            <div class="message error">${errorMsg}</div>
        </form>
    </div>

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
        
        // Simple password confirmation validation
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('form');
            const password = document.getElementById('password');
            const confirmPassword = document.getElementById('confirmPassword');
            
            form.addEventListener('submit', function(e) {
                if (password.value !== confirmPassword.value) {
                    e.preventDefault();
                    alert('Passwords do not match!');
                }
            });
        });
    </script>
</body>
</html>