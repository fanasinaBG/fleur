<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="client.RequeteClient" %>
<%@ page import="connection.DatabaseConnection" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%
        String nom = request.getParameter("nom");
        String email = request.getParameter("mail");
        String mdp = request.getParameter("mdp");

        RequeteAdmin admin = new RequeteAdmin();
        boolean isValid = admin.validateAdmin(email, mdp);

        if (isValid) {
            //HttpSession session = request.getSession(true);
            session.setAttribute("nom", nom);
            session.setAttribute("email", email);
            response.sendRedirect("../connecter.jsp");
    %>
    <p>Connexion réussie!</p>
    <%
        } else {
    %>
    <p>Mot de passe incorrect.</p>
    <%
        }
    %>
</body>
</html>