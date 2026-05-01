<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Modern Login Page" />
    <title>Login - LaptopShop</title>
    <link href="css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            font-family: 'Inter', sans-serif;
            margin: 0;
        }
        #layoutAuthentication { width: 100%; }
        .card {
            border: none;
            border-radius: 1rem;
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            overflow: hidden;
        }
        .card-header {
            background: transparent;
            border-bottom: none;
            padding-top: 2.5rem;
            padding-bottom: 0;
        }
        .card-header h3 {
            font-weight: 700 !important;
            color: #2d3748;
            font-size: 1.75rem;
        }
        .card-body { padding: 2rem 2.5rem; }
        .form-control {
            border-radius: 0.5rem;
            border: 1px solid #e2e8f0;
            padding: 1rem 0.75rem;
            background-color: #f7fafc;
        }
        .form-control:focus {
            background-color: #fff;
            border-color: #764ba2;
            box-shadow: 0 0 0 3px rgba(118, 75, 162, 0.2);
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 0.5rem;
            padding: 0.875rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 7px 14px rgba(118, 75, 162, 0.4);
        }
        .card-footer {
            background: transparent;
            border-top: 1px solid #edf2f7;
            padding: 1.5rem;
        }
        .card-footer a {
            color: #764ba2;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s;
        }
        .card-footer a:hover {
            color: #553c9a;
            text-decoration: underline;
        }
        .alert-custom {
            border-radius: 0.5rem;
            padding: 0.75rem 1rem;
            margin-bottom: 1.5rem;
            font-size: 0.875rem;
        }
    </style>
</head>
<body>
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-5 col-md-7">
                            <div class="card mt-4 mb-4">
                                <div class="card-header">
                                    <h3 class="text-center">Welcome Back</h3>
                                    <p class="text-center text-muted small mt-2">Sign in to your account</p>
                                </div>
                                <div class="card-body">
                                    <form method="post" action="/login">
                                        <c:if test="${param.error != null}">
                                            <div class="alert alert-danger alert-custom" role="alert">
                                                <i class="fas fa-exclamation-circle me-2"></i>Invalid email or password.
                                            </div>
                                        </c:if>
                                        <c:if test="${param.logout != null}">
                                            <div class="alert alert-success alert-custom" role="alert">
                                                <i class="fas fa-check-circle me-2"></i>You have been logged out successfully.
                                            </div>
                                        </c:if>

                                        <div class="form-floating mb-4">
                                            <input class="form-control" id="inputEmail" type="email" placeholder="name@example.com" name="username" required autofocus />
                                            <label for="inputEmail"><i class="fas fa-envelope me-2 text-muted"></i>Email address</label>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="inputPassword" type="password" placeholder="Password" name="password" required />
                                            <label for="inputPassword"><i class="fas fa-lock me-2 text-muted"></i>Password</label>
                                        </div>

                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                        
                                        <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                            <div class="form-check">
                                                <input class="form-check-input" id="inputRememberPassword" type="checkbox" name="remember-me" />
                                                <label class="form-check-label text-muted" for="inputRememberPassword">Remember me</label>
                                            </div>
                                            <a class="small text-muted text-decoration-none" href="#">Forgot Password?</a>
                                        </div>
                                        
                                        <div class="mt-4 d-grid">
                                            <button class="btn btn-primary btn-block text-white" type="submit">
                                                Login
                                            </button>
                                        </div>
                                    </form>
                                </div>
                                <div class="card-footer text-center">
                                    <div class="small">
                                        <span class="text-muted">Don't have an account?</span> 
                                        <a href="/register" style="position: relative; z-index: 10;">Sign up now!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
</body>
</html>