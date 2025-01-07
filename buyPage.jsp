<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="connection.DatabaseConnection" %>
<%@ page import="payment.RequettePDetails" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="payment.PaymentDetails" %>
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
    <% 
        String id=(String) session.getAttribute("id");
        List<FleursCategories> FleurCategorie = (List<FleursCategories>) session.getAttribute("FleurCategorie");
            if (FleurCategorie == null) {
                out.println("Aucune catégorie de fleur n'est disponible.");
                return;
            }

        FleursCategories selectedFleur = null;

         for (FleursCategories categoryFleur : FleurCategorie) { // Assurez-vous que FleurCategorie est disponible ici
                if (categoryFleur.getFleur_id() == Integer.parseInt(id)) {
                    selectedFleur = categoryFleur;
                    break;
                }
            }
        String racine=(String) session.getAttribute("racine");
        if (selectedFleur != null) {
            session.setAttribute("fleurNom", selectedFleur.getNomFleur());
            session.setAttribute("fleurPrix", String.valueOf(selectedFleur.getPrix()));
        }

        String fleur=(String) session.getAttribute("fleurNom");
        String prix=(String) session.getAttribute("fleurPrix");

         if (prix == null) {
            out.println("Erreur : Le prix de la fleur n'est pas défini.");
            return;
        }
        int prixs= Integer.parseInt(prix);
        int racines= Integer.parseInt(racine);
        int total=prixs*racines;
        session.setAttribute("total",total);
%>
   <p>racine <%= fleur%> avec <%= racine%> racine  prix unitaire <%=prixs%> total est <%=total%></p>
    <form action="Traitement/achat.jsp" method="POST">
        <div class="login">
              <div class="wrapper">
                    <div class="st">
                          <div class="form">
                                <div class="name">
                                <%
                                        // Appeler la méthode Java pour récupérer les catégories
                                        RequettePDetails payment = new RequettePDetails(); // Remplacez par le nom réel de la classe
                                        List<PaymentDetails> payments  = payment.fetchPDetails();
                                    %>
                                    <label for="choix">Choisissez une option :</label>
                                    <select id="choix" name="choix">
                                         <%
                                                // Générer les options de la liste déroulante
                                                for (PaymentDetails pDetail : payments) {
                                            %>
                                                <option value="<%= pDetail.getCart() %>"><%= pDetail.getCart() %></option>
                                            <%
                                                }
                                        %>
                                    </select>
                                </div>
                                <div class="name">
                                      <div class="bg">
                                          <input type="number" name="cardnumber" placeholder="card number">
                                          <img class="envelope-light-solid" alt="" src="assets/icon/Solid.svg">
                                      </div>
                                      
                                      
                                </div>
                          </div>
                    </div>
                    <button type="submit">Se connecter</button>
              </div>
  </form>	
</body>
</html>