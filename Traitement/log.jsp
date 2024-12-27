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
    <h1>Résultat de la soumission du formulaire</h1>
    <%
        String nom = request.getParameter("nom");
        String email = request.getParameter("email");
        // String mdp = request.getParameter("mdp");

        RequeteClient clients = new RequeteClient();
        boolean isValid = clients.validateClient(nom, email);

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
    <p>Nom d'utilisateur ou mot de passe incorrect.</p>
    <%
        }
    %>
</body>
</html>