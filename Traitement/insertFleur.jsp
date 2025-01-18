<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="fleur.Fleur" %>
<%@ page import="fleur.Fonction" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="promotion.RequetePromotion" %>
<%@ page import="promotion.PromFleur" %>
<%@ page import="promotion.Promotion" %>
<%
    RequetePromotion pro = new RequetePromotion();
    
    String fleurId = request.getParameter("categorie");  // Getting the string from the request
    if (fleurId == null || fleurId.isEmpty()) {
        out.println("<p>Erreur : L'ID de la fleur est manquant.</p>");
        return; // Arrête l'exécution si l'ID est manquant
    }

    int idFleur = 0;
    try {
        idFleur = Integer.parseInt(fleurId);
    } catch (NumberFormatException e) {
        out.println("<p>Erreur : L'ID de la fleur doit être un entier valide.</p>");
        return; // Arrête l'exécution si la conversion échoue
    }

    String startDate = request.getParameter("start-date"); // Récupère la date de début
    String endDate = request.getParameter("end-date"); // Récupère la date de fin
    String promo = request.getParameter("promo"); // Récupère le nom

    int proms = 0;
    try {
        proms = Integer.parseInt(promo); // Vérifier si le paramètre promo est un entier valide
    } catch (NumberFormatException e) {
        out.println("<p>Erreur : Le nom de la promotion doit être un entier valide.</p>");
        return; // Arrête l'exécution si la conversion échoue
    }

    Promotion prom = new Promotion(idFleur, proms, endDate, startDate);
    // Afficher les valeurs récupérées pour débogage (facultatif)
    System.out.println("Fleur ID: " + fleurId);
    System.out.println("Start Date: " + startDate);
    System.out.println("End Date: " + endDate);

    try {
        // Appel de la méthode qui pourrait lancer une SQLException
        pro.insertPromotion(startDate, endDate, promo, fleurId);

        // Si l'insertion réussie, rediriger vers une autre page ou afficher un message de succès
        out.println("<p>Insertion réussie !</p>");
    } catch (Exception e) {
        // Ceci capte toutes les autres erreurs, y compris SQLException qui est déjà gérée dans la méthode
        e.printStackTrace();
        out.println("<p>Erreur générale : " + e.getMessage() + "</p>");
    }
%>
