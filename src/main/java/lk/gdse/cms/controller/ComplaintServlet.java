package lk.gdse.cms.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import lk.gdse.cms.dao.ComplaintDAO;
import lk.gdse.cms.model.Complaint;
import lk.gdse.cms.model.User;


import java.io.IOException;


public class ComplaintServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        System.out.println("complaint servlet");

        HttpSession session = req.getSession(false);
        User user = (User) session.getAttribute("user");

        if (user != null) {
            String title = req.getParameter("title");
            String description = req.getParameter("description");

            String generatedId = ComplaintDAO.generateComplaintId();

            Complaint c = new Complaint(generatedId, title, description, user.getId(), "Pending");
            ComplaintDAO.saveComplaint(c);

            res.sendRedirect("pages/complaints.jsp");
        } else {
            res.sendRedirect("pages/login.jsp");
        }
    }
}
