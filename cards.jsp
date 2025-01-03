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
<html>
<head>
    <title>Résultats</title>
</head>
<body>
    <%
        // Récupérer les résultats transmis par l'attribut de requête
        //List<FleursCategories> fleurs = (List<FleursCategories>) request.getAttribute("fleurs");
        List<FleursCategories> cart = (List<FleursCategories>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
    %>
        <p>Aucune fleur trouvée.</p>
    <%
        } else {
    %>
        <table border="1">
            <thead>
                <tr>
                    <%-- <th>ID Fleur</th> --%>
                    <th>Nom</th>
                    <th>Prix</th>
                    <th>Descriptions</th>
                    <%-- <th>Images</th> --%>
                    <th>Nom Catégorie</th>
                    <th>Quantité</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (FleursCategories fleur : cart) {
                %>
                <tr>
                    <%-- <td><%= fleur.getFleurId() %></td> --%>
                    <td><%= fleur.getNomFleur() %></td>
                    <td><%= fleur.getPrix() %></td>
                    <td><%= fleur.getDescriptions() %></td>
                    <%-- <td><img src="<%= fleur.getImages() %>" alt="Image" width="100"></td> --%>
                    <td><%= fleur.getNomCategory() %></td>
                    <td><%= fleur.getQuantite() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <a href="Traitement/annuler.jsp" onclick="return confirm('Êtes-vous sûr de vouloir vider votre panier ?');">Annuler</a>
    <%
        }
    %>
</body>
</html>
