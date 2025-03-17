package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContactsDAO {
    private Connection connection;

    public ContactsDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/contactbook", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addContact(Contacts contact) {
        try {
            String sql = "INSERT INTO contacts (name, phone, email, address) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, contact.getName());
            statement.setString(2, contact.getPhone());
            statement.setString(3, contact.getEmail());
            statement.setString(4, contact.getAddress());
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Contacts> getAllContacts() {
        List<Contacts> contactsList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM contacts";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Contacts contact = new Contacts(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getString("phone"),
                    resultSet.getString("email"),
                    resultSet.getString("address")
                );
                contactsList.add(contact);
            }
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contactsList;
    }

    public Contacts getContactById(int id) {
        Contacts contact = null;
        try {
            String sql = "SELECT * FROM contacts WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                contact = new Contacts(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getString("phone"),
                    resultSet.getString("email"),
                    resultSet.getString("address")
                );
            }
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contact;
    }

    public void updateContact(Contacts contact) {
        try {
            String sql = "UPDATE contacts SET name=?, phone=?, email=?, address=? WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, contact.getName());
            statement.setString(2, contact.getPhone());
            statement.setString(3, contact.getEmail());
            statement.setString(4, contact.getAddress());
            statement.setInt(5, contact.getId());
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteContact(int id) {
        try {
            String sql = "DELETE FROM contacts WHERE id=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);  // Set the ID of the contact to delete
            statement.executeUpdate(); // Execute the delete query
            statement.close();  // Close the PreparedStatement
        } catch (SQLException e) {
            e.printStackTrace(); // Handle any SQL exceptions
        }
    }
}
