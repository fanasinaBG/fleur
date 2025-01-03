<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="client.RequeteClient" %>
<%@ page import="connection.DatabaseConnection" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="fleur.FleursCategories" %>
<%@ page import="fleur.RequeteFleurCategorie" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
     <%
        String quantites = request.getParameter("tige");
        Object sessionId=session.getAttribute("id");
        int id= 0;
        id=Integer.parseInt(sessionId.toString());
         List<FleursCategories> fleurs = null;

        if (quantites == null || quantites.trim().isEmpty()) {
    %>
            <p>Votre quantité est vide ou invalide.</p>
    <%
        } else {
            try {
                int quantite = Integer.parseInt(quantites); // Conversion en entier
                fleurs = RequeteFleurCategorie.getFleurQuantite(id);
                request.setAttribute("fleurs", fleurs);
                // Rediriger vers la page cible
                RequestDispatcher dispatcher = request.getRequestDispatcher("../cards.jsp");
                dispatcher.forward(request, response);
    %>
                <p>Votre quantité est : <%= quantite %></p>
                <p>Votre id est : <%= sessionId %></p>
    <% 
            } catch (NumberFormatException e) {
    %>
                <p>Erreur : La valeur fournie n'est pas un nombre valide.</p>
    <%
            }
        }
         if (fleurs == null || fleurs.isEmpty()) {
    %>
    <p>Aucune fleur trouvée pour l'ID fourni.</p>
    <%
        } else {
    %>
        <table border="1">
            <thead>
                <tr>
                    <th>ID Fleur</th>
                    <th>Nom</th>
                    <th>Prix</th>
                    <th>Descriptions</th>
                    <th>Nom Catégorie</th>
                    <th>Quantité</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (FleursCategories fleur : fleurs) {
                %>
                <tr>
                    <td><%= fleur.getNomFleur() %></td>
                    <td><%= fleur.getPrix() %></td>
                    <td><%= fleur.getDescriptions() %></td>
                    <td><img src="<%= fleur.getImages() %>" alt="Image de <%= fleur.getNomFleur() %>" width="100"></td>
                    <td><%= fleur.getNomCategory() %></td>
                    <td><%= fleur.getQuantite() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    <%
        }
    %>
   
</body>
</html>