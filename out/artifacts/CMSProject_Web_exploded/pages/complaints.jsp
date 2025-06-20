<%@ page import="java.util.*, lk.gdse.cms.model.User, lk.gdse.cms.model.Complaint, lk.gdse.cms.dao.ComplaintDAO" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Complaint> complaints = ComplaintDAO.getComplaintsByUserId(user.getId());
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Complaints</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-primary">My Complaints</h2>
        <a href="dashboard.jsp" class="btn btn-outline-secondary">Back to Dashboard</a>
    </div>

    <div class="table-responsive shadow-sm rounded">
        <table class="table table-bordered table-hover align-middle bg-white">
            <thead class="table-primary text-center">
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
            </tr>
            </thead>
            <tbody>
            <% for (Complaint c : complaints) { %>
            <tr>
                <td><%= c.getId() %></td>
                <td><%= c.getTitle() %></td>
                <td><%= c.getDescription() %></td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
