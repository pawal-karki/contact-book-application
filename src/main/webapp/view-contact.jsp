<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Contacts" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Contact</title>
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
            <h1>Contact Details</h1>
            <p class="subtitle">View complete information</p>
        </div>        
        <div class="contact-details">
            <div class="contact-detail">
                <span class="label">ID</span>
                <span class="value"><%= contact.getId() %></span>
            </div>
            
            <div class="contact-detail">
                <span class="label">Name</span>
                <span class="value"><%= contact.getName() %></span>
            </div>
            
            <div class="contact-detail">
                <span class="label">Phone</span>
                <span class="value"><%= contact.getPhone() %></span>
            </div>
            
            <div class="contact-detail">
                <span class="label">Email</span>
                <span class="value"><%= contact.getEmail() %></span>
            </div>
            
            <div class="contact-detail">
                <span class="label">Address</span>
                <span class="value"><%= contact.getAddress() %></span>
            </div>
        </div>
        
        <div class="btn-container">
            <a href="<%=request.getContextPath()%>/contacts/edit?id=<%= contact.getId() %>" class="btn btn-primary">
                <i class="bi bi-pencil"></i> Edit
            </a>
            <a href="<%=request.getContextPath()%>/contacts/delete?id=<%= contact.getId() %>" class="btn btn-danger"
               onclick="return confirm('Are you sure you want to delete this contact?')">
                <i class="bi bi-trash"></i> Delete
            </a>
        </div>
        
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