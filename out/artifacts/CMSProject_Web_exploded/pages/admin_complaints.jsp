<%@ page import="lk.gdse.cms.model.Complaint" %>
<%@ page import="lk.gdse.cms.dao.ComplaintDAO" %>
<%@ page import="lk.gdse.cms.model.User" %>
<%@ page import="java.util.*" %>

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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="text-primary">All Complaints</h2>
        <a href="dashboard.jsp" class="btn btn-outline-secondary">Back to Dashboard</a>
    </div>

    <div class="table-responsive shadow-sm rounded">
        <table class="table table-bordered table-hover align-middle bg-white">
            <thead class="table-primary text-center">
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>User ID</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <% for (Complaint c : allComplaints) { %>
            <tr>
                <td><%= c.getId() %></td>
                <td><%= c.getTitle() %></td>
                <td><%= c.getDescription() %></td>
                <td><%= c.getUserId() %></td>
                <td><span class="badge bg-info text-dark"><%= c.getStatus() %></span></td>
                <td class="text-center">
                    <form action="../DeleteComplaintServlet" method="post" class="d-inline"
                          onsubmit="return confirmDelete(event, '<%= c.getId() %>')">
                        <input type="hidden" name="id" value="<%= c.getId() %>" />
                        <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                    </form>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    </div>
</div>

<script>
    function confirmDelete(e, id) {
        e.preventDefault();
        Swal.fire({
            title: 'Are you sure?',
            text: "Complaint ID: " + id + " will be deleted!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#6c757d',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                e.target.submit(); // Proceed with form submission
            }
        });
        return false;
    }
</script>

</body>
</html>
