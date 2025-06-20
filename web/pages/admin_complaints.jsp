<%@ page import="java.util.*, lk.gdse.cms.model.Complaint, lk.gdse.cms.dao.ComplaintDAO" %>
<%@ page import="lk.gdse.cms.model.User" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Complaint> allComplaints = ComplaintDAO.getAllComplaints();
%>

<!DOCTYPE html>
<html>
<head>
    <title>All Complaints - Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-primary">All Complaints</h2>
        <a href="dashboard.jsp" class="btn btn-outline-secondary">Back to Dashboard</a>
    </div>

    <div class="table-responsive shadow-sm rounded bg-white p-3">
        <table class="table table-bordered table-hover align-middle text-center">
            <thead class="table-primary">
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>User ID</th>
                <th>Status</th>
                <th>Remarks</th>
                <th style="width: 200px;">Actions</th>
            </tr>
            </thead>
            <tbody>
            <% for (Complaint c : allComplaints) { %>
            <tr>
                <td><%= c.getId() %></td>
                <td><%= c.getTitle() %></td>
                <td><%= c.getDescription() %></td>
                <td><%= c.getUserId() %></td>
                <td>
                    <span class="badge
                        <%= "Pending".equalsIgnoreCase(c.getStatus()) ? "bg-warning text-dark" :
                            "Resolved".equalsIgnoreCase(c.getStatus()) ? "bg-success" :
                            "bg-info text-dark" %>">
                        <%= c.getStatus() %>
                    </span>
                </td>
                <td><%= c.getRemarks() != null ? c.getRemarks() : "-" %></td>
                <td>
                    <!-- Update Form -->
                    <form action="../UpdateComplaintServlet" method="post" class="mb-2">
                        <input type="hidden" name="id" value="<%= c.getId() %>" />
                        <select name="status" class="form-select form-select-sm mb-1" required>
                            <option value="Pending" <%= "Pending".equalsIgnoreCase(c.getStatus()) ? "selected" : "" %>>Pending</option>
                            <option value="In Progress" <%= "In Progress".equalsIgnoreCase(c.getStatus()) ? "selected" : "" %>>In Progress</option>
                            <option value="Resolved" <%= "Resolved".equalsIgnoreCase(c.getStatus()) ? "selected" : "" %>>Resolved</option>
                        </select>
                        <textarea name="remarks" class="form-control form-control-sm mb-2" rows="2" placeholder="Add remarks..."><%= c.getRemarks() != null ? c.getRemarks() : "" %></textarea>
                        <button type="submit" class="btn btn-warning btn-sm w-100">Update</button>
                    </form>

                    <!-- Delete Form -->
                    <form action="../DeleteComplaintServlet" method="post"
                          onsubmit="return confirm('Are you sure you want to delete this complaint?');">
                        <input type="hidden" name="id" value="<%= c.getId() %>" />
                        <button type="submit" class="btn btn-danger btn-sm w-100">Delete</button>
                    </form>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
