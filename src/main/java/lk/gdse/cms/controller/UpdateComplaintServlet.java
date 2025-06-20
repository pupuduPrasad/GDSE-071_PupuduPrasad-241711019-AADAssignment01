package lk.gdse.cms.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import lk.gdse.cms.model.User;
import lk.gdse.cms.dao.ComplaintDAO;
import java.io.IOException;

public class UpdateComplaintServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        System.out.println("updated");
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {
            res.sendRedirect("pages/login.jsp");
            return;
        }

        String id = req.getParameter("id");
        String status = req.getParameter("status");
        String remarks = req.getParameter("remarks");

        boolean updated = ComplaintDAO.updateStatusAndRemarks(id, status, remarks);

        if (updated) {
            res.sendRedirect("pages/admin_complaints.jsp?success=update");
        } else {
            res.sendRedirect("pages/admin_complaints.jsp?error=update");
        }
    }
}
