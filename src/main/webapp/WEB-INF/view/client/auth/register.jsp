<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Modern Register Page" />
    <title>Register - LaptopShop</title>
    <link href="/css/styles.css" rel="stylesheet" />
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
            padding: 2rem 0;
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
        .invalid-feedback {
            font-size: 0.8rem;
            margin-top: 0.25rem;
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
    </style>
</head>
<body>
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-7 col-md-9">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="text-center">Create Account</h3>
                                    <p class="text-center text-muted small mt-2">Join us and start shopping</p>
                                </div>
                                <div class="card-body">
                                    <form:form method="post" action="/register" modelAttribute="registerUser">
                                        <c:set var="errorPassword"><form:errors path="confirmPassword" cssClass="invalid-feedback" /></c:set>
                                        <c:set var="errorEmail"><form:errors path="email" cssClass="invalid-feedback" /></c:set>
                                        <c:set var="errorFirstName"><form:errors path="firstName" cssClass="invalid-feedback" /></c:set>
                                        
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <div class="form-floating">
                                                    <form:input class="form-control ${not empty errorFirstName ? 'is-invalid' : ''}" type="text" placeholder="First name" path="firstName" />
                                                    <label><i class="far fa-user me-2 text-muted"></i>First name</label>
                                                    ${errorFirstName}
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <div class="form-floating">
                                                    <form:input class="form-control" type="text" placeholder="Last name" path="lastName" />
                                                    <label><i class="far fa-user me-2 text-muted"></i>Last name</label>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="form-floating mb-3">
                                            <form:input class="form-control ${not empty errorEmail ? 'is-invalid' : ''}" type="email" placeholder="name@example.com" path="email" />
                                            <label><i class="far fa-envelope me-2 text-muted"></i>Email address</label>
                                            ${errorEmail}
                                        </div>
                                        
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <div class="form-floating">
                                                    <form:input class="form-control ${not empty errorPassword ? 'is-invalid' : ''}" type="password" placeholder="Password" path="password" />
                                                    <label><i class="fas fa-lock me-2 text-muted"></i>Password</label>
                                                    ${errorPassword}
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <div class="form-floating">
                                                    <form:input class="form-control" type="password" placeholder="Confirm password" path="confirmPassword" />
                                                    <label><i class="fas fa-lock me-2 text-muted"></i>Confirm Password</label>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="mt-4 d-grid">
                                            <button class="btn btn-primary btn-block text-white" type="submit">
                                                Create Account
                                            </button>
                                        </div>
                                    </form:form>
                                </div>
                                <div class="card-footer text-center">
                                    <div class="small">
                                        <span class="text-muted">Already have an account?</span> 
                                        <a href="/login" style="position: relative; z-index: 10;">Go to login</a>
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
    <script src="/js/scripts.js"></script>
</body>
</html>