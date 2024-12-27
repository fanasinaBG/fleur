<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="client.RequeteClient" %>
<%@ page import="client.Clients" %>
<%@ page import="connection.DatabaseConnection" %>

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
        String nom = request.getParameter("username");
        String email = request.getParameter("email");
        String mdp = request.getParameter("password");


        if (nom != null && email != null && mdp != null) {
            // Créer un objet Clients
            Clients client = new Clients();
            client.setNomClient(nom);
            client.setEmail(email);
            client.setMdp(mdp);
    
            // Appel de la méthode createClient
            RequeteClient kill = new RequeteClient();
            kill.createClient(client);
            session.setAttribute("nom", nom);
            session.setAttribute("email", email);
            session.setAttribute("mdp", mdp);
            response.sendRedirect("../connecter.jsp");
    
            // Afficher un message de confirmation
            out.println("<p>Client ajouté avec succès !</p>");
        } else {
            out.println("<p>Erreur : Veuillez remplir tous les champs.</p>");
        }
    %>
     
</body>
</html>