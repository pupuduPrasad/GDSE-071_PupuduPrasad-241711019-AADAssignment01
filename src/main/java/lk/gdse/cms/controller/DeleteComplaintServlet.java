package lk.gdse.cms.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import lk.gdse.cms.dao.ComplaintDAO;
import lk.gdse.cms.model.User;

import java.io.IOException;

public class DeleteComplaintServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user != null && "Admin".equalsIgnoreCase(user.getRole())) {
            try {
                String complaintId = req.getParameter("id");
                ComplaintDAO.deleteComplaintById(complaintId);
                res.sendRedirect("pages/admin_complaints.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                res.sendRedirect("pages/admin_complaints.jsp?error=true");
            }
        } else {
            res.sendRedirect("pages/login.jsp");
        }
    }
}
