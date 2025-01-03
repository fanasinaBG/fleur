<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
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
    List<FleursCategories> FleurCategorie = RequeteFleurCategorie.fleurCategory();
    session.setAttribute("FleurCategorie", FleurCategorie);

    String quantites = request.getParameter("tige");
    Object sessionId = session.getAttribute("id");
    int id = 0;

    if (sessionId != null) {
        id = Integer.parseInt(sessionId.toString());
    }

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
     response.setHeader("Refresh", "2; URL=../index.jsp");
%>

        </tbody>
     </table>
</body>
</html>