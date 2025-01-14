<%@ page import="fleur.RequeteFleurCategorie" %>
<%@ page import="fleur.FleursCategories" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="fleur.Fleur" %>
<%@ page import="fleur.Fonction" %>

<%
    Fonction fonction = new Fonction();

    String query = request.getParameter("query");
    if (query != null && !query.trim().isEmpty()) {
        Fleur fleur = fonction.searchFleur(query);

        if (fleur != null) {
            // Affichage des informations si un produit est trouvé
            String nomProduit = fleur.getNomFleur();
            int prix = fleur.getPrix();
            String descriptions = fleur.getDescriptions();
            String images = fleur.getImages();

            out.println("<p>Le produit est : " + nomProduit + "</p>");
            out.println("<p>Prix est : " + prix + " €</p>");
            out.println("<p>Description : " + descriptions + "</p>");
            out.println("<p>Image : <img src='" + images + "' alt='Image du produit'></p>");
        } else {
            // Message si aucun résultat trouvé
            out.println("<p>Aucun produit trouvé pour la recherche : " + query + "</p>");
        }
    } else {
        // Message si la recherche est vide
        out.println("<p>Veuillez entrer un mot-clé pour la recherche.</p>");
    }
%>
              