<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="payment.PaymentDetails" %>
<%@ page import="payment.RequettePDetails" %>
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
        String nom = (String) session.getAttribute("nom");
        String id = (String) session.getAttribute("id");
        String choix = request.getParameter("choix");
        String cardNumber = request.getParameter("cardnumber");
           // Vérifier si les paramètres ne sont pas null ou vides
    if (choix != null && !choix.isEmpty() && cardNumber != null && !cardNumber.isEmpty()) {
        // Créer une instance de RequettePDetails pour récupérer les données de la base
        RequettePDetails payment = new RequettePDetails();
        List<PaymentDetails> payments = payment.fetchPDetails();

        boolean isMatchFound = false;
        

        // Parcourir la liste des PaymentDetails et comparer
        for (PaymentDetails pDetail : payments) {
            String baseCardNumber = pDetail.getNumerocart().replaceAll("\\s+", "");
            out.println( "base:"+baseCardNumber );
            if (pDetail.getCart().equals(choix) && baseCardNumber.equals(cardNumber)) {
                isMatchFound = true;
                break;  // Sortir de la boucle dès qu'une correspondance est trouvée
            }
        }

        if (isMatchFound) {
            out.println("<p>La correspondance a été trouvée : " + choix + " - " + cardNumber + "</p>");
            response.sendRedirect("../attente.jsp");
        } else {
            out.println("<p>Aucune correspondance trouvée. Le numéro de carte ne correspond pas au choix sélectionné.</p>");
            response.setHeader("Refresh", "2; URL=../buyPage.jsp");
        }
    } else {
        out.println("<p>Le choix ou le numéro de carte est manquant.</p>");
        response.setHeader("Refresh", "2; URL=../buyPage.jsp");
    }

    %> 
    <p>nom : <strong><%= nom %></strong></p>
    <p>id de votre produit : <strong><%= id %></strong></p>
    <p>Vous avez choisi : <strong><%= choix %></strong></p>
    <p>Numéro de carte saisi : <strong><%= cardNumber %></strong></p>  
</body>
</html>