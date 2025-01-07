<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="connection.DatabaseConnection" %>
<%@ page import="categorie.RequeteCategorie" %>
<%@ page import="fleur.Fleur" %>
<%@ page import="fleur.RequeteFleurCategorie" %>
<%@ page import="fleur.FleursCategories" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<style>
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
            text-align: left;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
        }
        th {
            background-color: #f4f4f4;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
    <h1>Liste des Fleurs</h1>
    <table>
        <thead>
            <tr>
                <th>images</th>
                <th>Fleur</th>
                <th>quantite</th>
                <th>prix</th>
                <th>Category</th>
                <th>descriptions</th>
                <th>action</th>
            </tr>
        </thead>
        <% 
            List<FleursCategories> FleurCategorie = RequeteFleurCategorie.fleurCategory();
        %>
        <tbody>
            <%
                for (FleursCategories categoryFleur : FleurCategorie) {
            %>
            <tr>
                    <td><img src="<%=request.getContextPath() + categoryFleur.getImages() %>"></td>
                    <td><%=categoryFleur.getNomFleur()%></td>
                    <td><%= categoryFleur.getQuantite() %></td>
                    <td><%= categoryFleur.getPrix() %></td>
                    <td><%= categoryFleur.getNomCategory() %></td>
                    <td><%= categoryFleur.getDescriptions() %></td>
                     <td>
                        <a href="Traitement/gestionFleur.jsp?id=<%= categoryFleur.getFleur_id() %>">
                            suprimer
                        </a>
                    </td>
                </tr>
            <% } %>
        </tbody>
</body>
</html>