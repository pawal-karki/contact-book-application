<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Contact</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/styles.css">
</head>
<body class="center-container">
    <div class="container form-container fade-in">
        <div class="header">
            <a href="<%=request.getContextPath()%>/contacts/list" class="back-link">
                <i class="bi bi-arrow-left"></i> Back to list
            </a>
            <h1>Add New Contact</h1>
            <p class="subtitle">Enter the contact information below</p>
        </div>
        
        <form action="<%=request.getContextPath()%>/contacts/insert" method="post">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" placeholder="Enter full name" required>
            </div>
            
            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="text" id="phone" name="phone" placeholder="Enter phone number" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter email address" required>
            </div>
            
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" placeholder="Enter full address" required>
            </div>
            
            <div class="btn-container">
                <button type="submit" class="btn btn-primary">
                    <i class="bi bi-check-circle"></i> Save Contact
                </button>
                <a href="<%=request.getContextPath()%>/contacts/list" class="btn btn-secondary">
                    <i class="bi bi-x-circle"></i> Cancel
                </a>
            </div>
        </form>
    </div>
</body>
</html>