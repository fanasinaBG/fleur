<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
    <title>Traitement Promotion</title>
</head>
<body>
    <h1>Résultat de l'ajout de la promotion</h1>

    <% 
        // Récupération des paramètres du formulaire
        String produit = request.getParameter("produit");
        String dateDebut = request.getParameter("dateDebut");
        String dateFin = request.getParameter("dateFin");
        String reductionStr = request.getParameter("promo");

        // Validation des champs
        boolean isValid = true;
        StringBuilder errors = new StringBuilder();

        if (produit == null || produit.isEmpty()) {
            isValid = false;
            errors.append("Le produit est obligatoire.<br>");
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date parsedDateDebut = null;
        Date parsedDateFin = null;
        
        try {
            parsedDateDebut = sdf.parse(dateDebut);
        } catch (Exception e) {
            isValid = false;
            errors.append("La date de début est invalide. Utilisez le format YYYY-MM-DD.<br>");
        }

        try {
            parsedDateFin = sdf.parse(dateFin);
        } catch (Exception e) {
            isValid = false;
            errors.append("La date de fin est invalide. Utilisez le format YYYY-MM-DD.<br>");
        }

        if (parsedDateDebut != null && parsedDateFin != null && !parsedDateDebut.before(parsedDateFin)) {
            isValid = false;
            errors.append("La date de fin doit être ultérieure à la date de début.<br>");
        }

        double reduction = 0;
        try {
            reduction = Double.parseDouble(reductionStr);
            if (reduction <= 0 || reduction > 100) {
                isValid = false;
                errors.append("La réduction doit être un pourcentage entre 1 et 100.<br>");
            }
        } catch (Exception e) {
            isValid = false;
            errors.append("La réduction doit être un nombre valide.<br>");
        }

        if (isValid) {
            // Traitement logique ici (par exemple, enregistrer dans une base de données)
            out.println("<p>Promotion ajoutée avec succès :</p>");
            out.println("<ul>");
            out.println("<li>Produit : " + produit + "</li>");
            out.println("<li>Date de début : " + dateDebut + "</li>");
            out.println("<li>Date de fin : " + dateFin + "</li>");
            out.println("<li>Réduction : " + reduction + "%</li>");
            out.println("</ul>");
        } else {
            // Affichage des erreurs
            out.println("<p>Des erreurs sont survenues lors du traitement :</p>");
            out.println("<div style='color:red;'>" + errors.toString() + "</div>");
        }
    %>

    <a href="../formPromotion.jsp">Retour au formulaire</a>
</body>
</html>
