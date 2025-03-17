<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Contacts" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Contact</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/styles.css">
</head>
<body class="center-container">
    <div class="container form-container fade-in">
        <%
        Contacts contact = (Contacts) request.getAttribute("contact");
        if (contact != null) {
        %>
        <div class="header">
            <a href="<%=request.getContextPath()%>/contacts/list" class="back-link">
                <i class="bi bi-arrow-left"></i> Back to list
            </a>
            <h1>Edit Contact</h1>
            <p class="subtitle">Update contact information</p>
        </div>
        
        <form action="<%=request.getContextPath()%>/contacts/update" method="post">
            <input type="hidden" name="id" value="<%= contact.getId() %>">
            
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" value="<%= contact.getName() %>" placeholder="Enter full name" required>
            </div>
            
            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="text" id="phone" name="phone" value="<%= contact.getPhone() %>" placeholder="Enter phone number" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" value="<%= contact.getEmail() %>" placeholder="Enter email address" required>
            </div>
            
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address" value="<%= contact.getAddress() %>" placeholder="Enter full address" required>
            </div>
            
            <div class="btn-container">
                <button type="submit" class="btn btn-primary">
                    <i class="bi bi-check-circle"></i> Update Contact
                </button>
                <a href="<%=request.getContextPath()%>/contacts/list" class="btn btn-secondary">
                    <i class="bi bi-x-circle"></i> Cancel
                </a>
            </div>
        </form>
        
        <% } else { %>
            <div class="error-container">
                <i class="bi bi-exclamation-triangle error-icon"></i>
                <p class="error-message">Error: Contact not found</p>
                <a href="<%=request.getContextPath()%>/contacts/list" class="btn btn-secondary">
                    <i class="bi bi-arrow-left"></i> Back to Contact List
                </a>
            </div>
        <% } %>
    </div>
</body>
</html>