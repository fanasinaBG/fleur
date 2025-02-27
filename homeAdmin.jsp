<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="connection.DatabaseConnection" %>
<%@ page import="commande.Commande" %>
<%@ page import="commande.RequetComande" %>
<%@ page import="vente.RequetteVueVente" %>
<%@ page import="vente.VueVente" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>





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
<%
    RequetComande command = new RequetComande();
     List<Commande> commandes = command.getCommande();

%>
 <h1>Liste des Commandes</h1>
    <table>
        <thead>
            <tr>
                <th>id</th>
                <th>personne</th>
                <th>Produit</th>
                <th>quantite</th>
                <th>prixUnitaire</th>
                <th>prixTotal</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (Commande commande : commandes) {
            %>
            <tr>
                    <td><%= commande.getId() %></td>
                    <td><%= commande.getPersonne() %></td>
                    <td><%= commande.getNomProduit() %></td>
                    <td><%= commande.getQuantite() %></td>
                    <td><%= commande.getPrixUnitaire() %></td>
                    <td><%= commande.getPrixTotal() %></td>
                     <td>
                        <a href="Traitement/detailCommande.jsp?id=<%= commande.getId() %>">
                            Voir Détails
                        </a>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table>

    <a href="gestionFleur.jsp">
        gestion fleure
    </a>
    <a href="voirVente.jsp">
        les
    </a>

    <h1>Liste des ventes</h1>
    <%
        RequetteVueVente vente= new RequetteVueVente();
          List<VueVente> achat= vente.getVente();
        //   Map<String, Integer> clientTotalPrices=vente.getTotalPricesPerClient();
    %>
        <table>
            <thead>
            <tr>
                <th>Client</th>
                <th>Produit</th>
                <th>prix</th>
                <th>date d'achat</th>
            </tr>
         </thead>
        <tbody>
        <%
           for(VueVente ventes : achat){ 
        %>
        <tr>
                    <td><%= ventes.getNom_client() %></td>
                    <td><%= ventes.getNom_fleur() %></td>
                    <td><%= ventes.getPrix_fleur() %> AR</td>
                    <td><%= ventes.getDate() %></td>
        </tr>
        </tbody>
        <% }%>
        </table>

        <h1>Liste des remises</h1>
        <% 
            Map<String, Integer> clientTotalPrices = vente.getTotalPricesPerClient();
            
        %>

         <table>
            <thead>
                <tr>
                    <th>Client</th>
                    <th>total prix</th>
                </tr>
            </thead>
            <tbody>
               <%
                 for (Map.Entry<String, Integer> entry : clientTotalPrices.entrySet()) {
                    %>
                 
                <tr>
                        <td><%=  entry.getKey() %></td>
                        <td><%= (entry.getValue() * 10)/100 %> AR</td>
                </tr>
            </tbody>
            <%
            }
            %>
        <table>

</body>
</html>