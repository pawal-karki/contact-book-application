<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Contacts" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Management System</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/styles.css">
</head>
<body>
    <div class="container list-container fade-in">
        <div class="list-header">
            <div>
                <h1>Contact Management System</h1>
                <p class="subtitle">Manage your contacts efficiently</p>
            </div>
            <a href="<%=request.getContextPath()%>/contacts/new" class="btn btn-primary">
                <i class="bi bi-plus-circle"></i> Add New Contact
            </a>
        </div>
        
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Email</th>
                        <th class="hide-mobile">Address</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    List<Contacts> contactsList = (List<Contacts>) request.getAttribute("contactsList");
                    if (contactsList != null && !contactsList.isEmpty()) {
                        for (Contacts contact : contactsList) {
                    %>
                        <tr>
                            <td><%= contact.getId() %></td>
                            <td><%= contact.getName() %></td>
                            <td><%= contact.getPhone() %></td>
                            <td><%= contact.getEmail() %></td>
                            <td class="hide-mobile"><%= contact.getAddress() %></td>
                            <td class="actions">
                                <a href="<%=request.getContextPath()%>/contacts/view?id=<%= contact.getId() %>" class="btn btn-info btn-sm" title="View Details">
                                    <i class="bi bi-eye"></i>
                                </a>
                                <a href="<%=request.getContextPath()%>/contacts/edit?id=<%= contact.getId() %>" class="btn btn-primary btn-sm" title="Edit Contact">
                                    <i class="bi bi-pencil"></i>
                                </a>
                                <a href="<%=request.getContextPath()%>/contacts/delete?id=<%= contact.getId() %>" class="btn btn-danger btn-sm" 
                                   onclick="return confirm('Are you sure you want to delete this contact?')" title="Delete Contact">
                                    <i class="bi bi-trash"></i>
                                </a>
                            </td>
                        </tr>
                    <%
                        }
                    } else {
                    %>
                        <tr>
                            <td colspan="6">
                                <div class="empty-state">
                                    <i class="bi bi-person-slash"></i>
                                    <p>No contacts found in the system</p>
                                    <a href="<%=request.getContextPath()%>/contacts/new" class="btn btn-primary">
                                        <i class="bi bi-plus-circle"></i> Add Your First Contact
                                    </a>
                                </div>
                            </td>
                        </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>