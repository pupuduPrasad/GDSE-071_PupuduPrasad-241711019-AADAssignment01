<%@ page import="lk.gdse.cms.model.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - CMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm sticky-top">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">CMS Dashboard</a>
        <div class="d-flex align-items-center">
            <div class="me-3 text-end">
                <div class="fw-semibold"><%= user.getUsername() %></div>
                <div class="badge bg-secondary text-light"><%= user.getRole() %></div>
            </div>
            <a href="../LogoutServlet" class="btn btn-danger btn-sm">Logout</a>
        </div>
    </div>
</nav>

<div class="container py-5">
    <div class="text-center mb-5">
        <h2 class="fw-bold">Welcome, <%= user.getUsername() %>!</h2>
        <p class="text-muted">Manage your complaints efficiently and stay updated.</p>
    </div>

    <div class="row g-4">
        <!-- Submit Complaint Card -->
        <div class="col-md-6">
            <div class="card h-100 shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title">Submit New Complaint</h5>
                    <p class="card-text text-muted">Quickly report any issue to the admin team.</p>
                    <a href="submit_complaint.jsp" class="btn btn-success">Submit Complaint</a>
                </div>
            </div>
        </div>

        <!-- View  Complaints Card -->
        <div class="col-md-6">
            <div class="card h-100 shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title">View My Complaints</h5>
                    <p class="card-text text-muted">Track the progress and status of your submitted complaints.</p>
                    <a href="complaints.jsp" class="btn btn-primary">View Complaints</a>
                </div>
            </div>
        </div>

        <!-- Admin view Complaints Card -->
        <% if ("Admin".equalsIgnoreCase(user.getRole())) { %>
        <div class="col-md-12">
            <div class="card h-100 border-warning shadow-sm">
                <div class="card-body text-center">
                    <h5 class="card-title text-warning">Admin Controls</h5>
                    <p class="card-text text-muted">Manage and monitor all user complaints in the system.</p>
                    <a href="admin_complaints.jsp" class="btn btn-warning text-white">Manage All Complaints</a>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>

<!-- Footer -->
<footer class="text-center py-4 text-muted border-top mt-5">
    <small>Prasad 2025 Complaint Management System | Developed for IJSE GDSE</small>
</footer>

</body>
</html>
