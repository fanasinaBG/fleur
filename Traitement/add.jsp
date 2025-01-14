<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="fleur.FleursCategories" %>

<%
    // Récupérer l'ID de la fleur à partir des paramètres
    String idParam = request.getParameter("id");
     System.out.println("ID récupéré : " + idParam);

    if (idParam != null && !idParam.trim().isEmpty()) {
        session.setAttribute("idParam", idParam);
        int id = Integer.parseInt(idParam);
       
        // Récupérer la liste complète des fleurs (précédemment stockée dans la session)
        List<FleursCategories> FleurCategorie = (List<FleursCategories>) session.getAttribute("FleurCategorie");


        if (FleurCategorie != null) {
            // Rechercher la fleur sélectionnée
            FleursCategories selectedFleur = null;
            for (FleursCategories categoryFleur : FleurCategorie) {
                if (categoryFleur.getFleur_id() == id) {
                    selectedFleur = categoryFleur;
                    break;
                }
            }

            if (selectedFleur != null) {
                // Récupérer ou initialiser le panier dans la session
                List<FleursCategories> cart = (List<FleursCategories>) session.getAttribute("cart");
                if (cart == null) {
                    cart = new ArrayList<>();
                    session.setAttribute("cart", cart);
                }

                // Ajouter la fleur sélectionnée au panier
                cart.add(selectedFleur);
                session.setAttribute("cart", cart);
                // Message de confirmation
                out.println("<p>Fleur ajoutée au panier avec succès : " + selectedFleur.getNomFleur() + "</p>");
            } else {
                out.println("<p>Fleur non trouvée.</p>");
            }
        } else {
            out.println("<p>La liste des fleurs n'est pas disponible.</p>");
        }
    } else {
        out.println("<p>ID de la fleur invalide.</p>");
    }

    // Redirection automatique vers une autre page (par exemple, le panier)
    response.setHeader("Refresh", "2; URL=../index.jsp");
%>
