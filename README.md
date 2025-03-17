# 📘 Contact Management System

A Java web application for managing contacts built with Jakarta EE Servlet, JSP, and MySQL.

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Jakarta EE](https://img.shields.io/badge/Jakarta_EE-orange?style=for-the-badge&logo=eclipse&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-00000F?style=for-the-badge&logo=mysql&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-007396?style=for-the-badge&logo=java&logoColor=white)

## 🌟 Features

- ✅ View all contacts in a responsive table list
- ✅ Add new contacts with simple form validation
- ✅ View detailed contact information
- ✅ Edit existing contacts
- ✅ Delete contacts with confirmation
- ✅ Clean and responsive UI

## 📁 Project Structure

```
contact-management-system/
├── src/
│   └── main/
│       ├── java/
│       │   ├── controller/
│       │   │   └── ContactsServlet.java       # Controller handling all HTTP requests
│       │   └── model/
│       │       ├── Contacts.java              # Model class for contact data
│       │       └── ContactsDAO.java           # Data Access Object for database operations
│       └── webapp/
│           ├── add-contact.jsp                # Form for creating new contacts
│           ├── contact-list.jsp               # Main page displaying all contacts
│           ├── edit-contact.jsp               # Form for editing contacts
│           ├── view-contact.jsp               # Detailed view of a specific contact
│           └── WEB-INF/
│               └── web.xml                    # Web application deployment descriptor
├── pom.xml                                    # Maven project configuration
└── README.md                                  # This file
```

## 🚀 Setup and Installation

### Prerequisites

- JDK 8 or higher
- Apache Tomcat 10.0 or higher
- MySQL Database 5.7 or higher

### Database Setup

1. Create a new MySQL database:
   ```sql
   CREATE DATABASE contactbook;
   ```

2. Create the contacts table:
   ```sql
   USE contactbook;
   
   CREATE TABLE contacts (
       id INT PRIMARY KEY AUTO_INCREMENT,
       name VARCHAR(100) NOT NULL,
       phone VARCHAR(20) NOT NULL,
       email VARCHAR(100) NOT NULL,
       address VARCHAR(255) NOT NULL
   );
   ```

### Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/contact-management-system.git
   cd contact-management-system
   ```

2. Configure the database connection in `src/main/java/model/ContactsDAO.java` if needed:
   ```java
   connection = DriverManager.getConnection(
       "jdbc:mysql://localhost:3306/contactbook", "root", "your_password");
   ```

3. Build the project:
   ```bash
   mvn clean package
   ```

4. Deploy the generated WAR file to your Tomcat server or use your IDE's deployment tools.

## 🖥️ Usage

1. Access the application at `http://localhost:8080/contact-management-system/contacts/list`
2. Use the intuitive UI to manage your contacts:
   - Click "Add New Contact" to create a new entry
   - Use "View", "Edit", or "Delete" buttons to manage existing contacts

## 📸 Screenshots
```Comming Soon```
## 🔧 Technical Details

### Model

- **Contacts.java**: Java bean for contact data with properties for ID, name, phone, email, and address.
- **ContactsDAO.java**: Handles database operations with JDBC for creating, reading, updating, and deleting contacts.

### Controller

- **ContactsServlet.java**: Central controller that handles all HTTP requests, implementing the MVC pattern.

### View

- **JSP Files**: Render the HTML with embedded Java code using scriptlet tags for dynamic content generation.

## 🔄 API Endpoints

| Method | URL | Description |
|--------|-----|-------------|
| GET | /contacts/list | Displays all contacts |
| GET | /contacts/new | Displays form to add new contact |
| GET | /contacts/view?id={id} | Shows details of a specific contact |
| GET | /contacts/edit?id={id} | Shows form to edit a contact |
| GET | /contacts/delete?id={id} | Deletes a specific contact |
| POST | /contacts/insert | Creates a new contact |
| POST | /contacts/update | Updates an existing contact |

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request
