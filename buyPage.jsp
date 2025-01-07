<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="connection.DatabaseConnection" %>
<%@ page import="payment.RequettePDetails" %>
<%@ page import="java.util.List" %>
<%@ page import="payment.PaymentDetails" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <p>hello</p>
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