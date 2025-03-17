package controller;

import model.Contacts;
import model.ContactsDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/contacts/*")
public class ContactsServlet extends HttpServlet {
    private ContactsDAO contactsDAO;

    public void init() {
        contactsDAO = new ContactsDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();

        if (action == null) {
            action = "/list";
        }

        switch (action) {
            case "/new":
                request.getRequestDispatcher("/add-contact.jsp").forward(request, response);
                break;
            case "/edit":
                int editId = Integer.parseInt(request.getParameter("id"));
                Contacts editContact = contactsDAO.getContactById(editId);
                request.setAttribute("contact", editContact);
                request.getRequestDispatcher("/edit-contact.jsp").forward(request, response);
                break;
            case "/view":
                int viewId = Integer.parseInt(request.getParameter("id"));
                Contacts viewContact = contactsDAO.getContactById(viewId);
                request.setAttribute("contact", viewContact);
                request.getRequestDispatcher("/view-contact.jsp").forward(request, response);
                break;
            case "/delete":
                int deleteId = Integer.parseInt(request.getParameter("id"));
                contactsDAO.deleteContact(deleteId);
                response.sendRedirect("list");
                break;
            default:
                List<Contacts> contactsList = contactsDAO.getAllContacts();
                request.setAttribute("contactsList", contactsList);
                request.getRequestDispatcher("/contact-list.jsp").forward(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();

        if (action == null) {
            action = "/list";
        }

        switch (action) {
            case "/insert":
                Contacts newContact = new Contacts(0, request.getParameter("name"), request.getParameter("phone"),
                        request.getParameter("email"), request.getParameter("address"));
                contactsDAO.addContact(newContact);
                response.sendRedirect("list");
                break;
            case "/update":
                Contacts updatedContact = new Contacts(
                        Integer.parseInt(request.getParameter("id")),
                        request.getParameter("name"),
                        request.getParameter("phone"),
                        request.getParameter("email"),
                        request.getParameter("address")
                );
                contactsDAO.updateContact(updatedContact);
                response.sendRedirect("list");
                break;
            default:
                response.sendRedirect("list");
                break;
        }
    }
}