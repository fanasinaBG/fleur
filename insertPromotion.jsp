<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="fleur.Fonction" %>
<%@ page import="connection.DatabaseConnection" %>
<%@ page import="categorie.RequeteCategorie" %>
<%@ page import="fleur.Fleur" %>
<%@ page import="fleur.RequeteFleurCategorie" %>
<%@ page import="fleur.FleursCategories" %>
<%@ page import="promotion.RequetePromotion" %>
<%@ page import="promotion.PromFleur" %>
<%@ page import="promotion.Promotion" %>

<% 
    Fonction fonction = new Fonction();
    List<Fleur> fleurs = fonction.fetchsCategories();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-container {
            background-color: #fff;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .form-container label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .form-container input,
        .form-container select,
        .form-container button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .form-container button {
            background-color: #2a9d8f;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container button:hover {
            background-color: #21867a;
        }
    </style>


</head>
<body>
    <div class="form-container">
        <h2>Formulaire d'Insertion</h2>
        <form action="Traitement/insertFleur.jsp" method="POST">

            <!-- Liste déroulante -->
            <label for="categorie">Catégorie :</label>
            <select id="categorie" name="categorie" required>
                <option value="" disabled selected>Choisissez une fleur</option>

                 <% 
                    if (fleurs != null && !fleurs.isEmpty()) {
                        for (Fleur fleur : fleurs) {
                %>
                <option value="<%= fleur.getId() %>"><%= fleur.getNomFleur() %></option>
                <% 
                    }
                }
                %>
            </select>

            <label for="promotion">votre promotion</label>
            <input type="number" id="promo" name="promo" required>

            <label for="start-date">Date de début :</label>
            <input type="date" id="start-date" name="start-date" required>

            
            
            <!-- Date de fin -->
            <label for="end-date">Date de fin :</label>
            <input type="date" id="end-date" name="end-date" required>

            <!-- Bouton d'envoi -->
            <button type="submit">Envoyer</button>
        </form>
    </div>
</body>
</html>