<%@ page import="java.util.List" %>
<%@ page import="vente.Vente" %>
<%@ page import="vente.RequetteVente" %>
<%@ page import="fleur.FleursCategories" %>

<!DOCTYPE html>
<html>
<head>
    <title>Achat</title>
</head>
<body>
    <%
        // Récupérer le panier depuis la session
        List<FleursCategories> cart = (List<FleursCategories>) session.getAttribute("cart");
        Object idClient=session.getAttribute("idClient");
        int idClients = 0;

            if (idClient != null) {
            // Assurez-vous que l'ID du client est bien une chaîne avant de le convertir
            try {
                idClients = Integer.parseInt(idClient.toString());
            } catch (NumberFormatException e) {
                out.println("Erreur : ID client non valide.");
            }
        } else {
            out.println("Erreur : Aucun ID client trouvé dans la session.");
        }
    %>
    <p><%= idClients %> le id est </p>
    <a href="../login.jsp">Se connecter</a>
        <%

        if (cart == null || cart.isEmpty()) {
    %>
        <p>Votre panier est vide.</p>
    <%
        } else {
            // Initialiser l'objet pour insérer les données
            RequetteVente requetteVente = new RequetteVente();

            // Parcourir les éléments du panier et insérer dans la base de données
            for (FleursCategories fleur : cart) {
                // Vente vente = new Vente(idClients, fleur.getFleur_id());
                requetteVente.insertVente(idClients, fleur.getFleur_id());
            }

            // Vider le panier après l'achat
            session.removeAttribute("cart");
    %>
        <p>Achat réussi ! Merci pour votre commande.</p>
        <a href="../index.jsp">Retour à l'accueil</a>
    <%
        }
    %>
</body>
</html>
