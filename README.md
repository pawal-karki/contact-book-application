Contact Management System
A simple Java web application for managing contacts using Jakarta EE Servlet, JSP, and MySQL.
Overview
This Contact Management System allows users to perform CRUD operations (Create, Read, Update, Delete) on contact records. It's built using:
Jakarta EE Servlet
JSP (JavaServer Pages) with scriptlet tags
MySQL Database
MVC (Model-View-Controller) architecture
Features
View all contacts in a list
Add new contacts
View contact details
Edit existing contacts
Delete contacts

Project Structure
contact-management-system/
├── src/
│   └── main/
│       ├── java/
│       │   ├── controller/
│       │   │   └── ContactsServlet.java
│       │   └── model/
│       │       ├── Contacts.java
│       │       └── ContactsDAO.java
│       └── webapp/
│           ├── add-contact.jsp
│           ├── contact-list.jsp
│           ├── edit-contact.jsp
│           ├── view-contact.jsp
│           └── WEB-INF/
│               └── web.xml
├── pom.xml
└── README.md
