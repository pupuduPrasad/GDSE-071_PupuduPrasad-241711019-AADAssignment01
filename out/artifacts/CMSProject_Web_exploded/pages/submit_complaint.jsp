<%@ page import="lk.gdse.cms.model.User" %>
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
    <title>Submit Complaint</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="text-center mb-5">
        <h2 class="fw-bold text-primary">Submit a New Complaint</h2>
        <p class="text-muted">Please provide clear details so we can resolve your issue effectively.</p>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-sm border-0">
                <div class="card-body p-4">
                    <form method="post" action="<%= request.getContextPath() %>/ComplaintServlet">
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Complaint Title</label>
                            <input type="text" name="title" class="form-control" placeholder="e.g. Internet not working" required />
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-semibold">Description</label>
                            <textarea name="description" class="form-control" rows="5" placeholder="Describe the issue in detail..." required></textarea>
                        </div>

                        <div class="d-flex justify-content-between">
                            <a href="dashboard.jsp" class="btn btn-outline-secondary">Back to Dashboard</a>
                            <button type="submit" class="btn btn-primary px-4">Submit</button>
                        </div>
                    </form>
                </div>
            </div>

            <%
                String success = (String) session.getAttribute("success");
                if (success != null) {
                    session.removeAttribute("success");
            %>
            <div class="alert alert-success alert-dismissible fade show mt-4" role="alert">
                <%= success %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <% } %>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>