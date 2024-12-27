<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="fleur.Fonction" %>
<%@ page import="connection.DatabaseConnection" %>
<%@ page import="categorie.RequeteCategorie" %>
<%@ page import="fleur.Fleur" %>
<%@ page import="fleur.RequeteFleurCategorie" %>
<%@ page import="fleur.FleursCategories" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    // Créer une instance de votre DAO et récupérer la liste des catégories
    RequeteCategorie Category = new RequeteCategorie();
    List<String> categories = Category.readCategorie();  // Appel de la méthode pour récupérer les catégories
    Fonction fonction = new Fonction();
    List<Fleur> fleurs = fonction.getShuffledFleurs(6);
    List<FleursCategories> FleurCategorie = RequeteFleurCategorie.fleurCategory();
%>


<!DOCTYPE html>
<html>
<head>
  	<meta charset="utf-8">
  	<meta name="viewport" content="initial-scale=1, width=device-width">
  	
  	<link rel="stylesheet"  href="assets/css/index.css" />
  	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" />
  	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&display=swap" />
  	
  	
  	
</head>
<body>
    <div class="home">
        <div class="banner">
            <div class="header">
                <div class="header-child"></div>
                <div class="group-parent">
                    <div class="home-parent">
                        <div class="help">Home</div>
                        <div class="shop">Shop</div>
                        <div class="about">About</div>
                        <div class="contact">
                            <a href="login.jsp" style="text-decoration: none; color: inherit;">Se deconnecter</a>
                          </div>
                    </div>
                     <%
                        //HttpSession session = request.getSession(false);
                        if (session != null) {
                            String nom = (String) session.getAttribute("nom");
                            String email = (String) session.getAttribute("email");
                    %>
                        <h1>Bienvenue, <%= nom %>!</h1>
                        <p>Votre email est : <%= email %></p>
                        <%
                            }
                        %>
                    <div class="mdiaccount-alert-outline-parent" id="groupContainer1">
                        <img class="mdiaccount-alert-outline-icon" alt="" src="mdi:account-alert-outline.svg">
                        <img class="akar-iconssearch" alt="" src="akar-icons:search.svg">
                        <img class="akar-iconsheart" alt="" src="akar-icons:heart.svg">
                        <img class="ant-designshopping-cart-outli-icon" alt="" src="ant-design:shopping-cart-outlined.svg">
                        <div class="meubel-house-logos-05-parent">
                            <img class="meubel-house-logos-05-icon" alt="" src="Meubel House_Logos-05.png">
                            <b class="skinclinic">Furniro</b>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="position: relative;"> <!-- Conteneur positionné pour gérer le rectangle -->
            <img class="scandinavian-interior-mockup-w-icon" alt="" src="assets/image/scandinavian-interior-mockup-wall-decal-background 1.png">
            <div class="rectangle-div"></div>
        </div>
    

    <div class="category">
        <div class="explore">
        <p>Explorer par category</p>
    </div>
   
        <div class="content">
    <% 
        if (fleurs != null && !fleurs.isEmpty()) {
            for (int i = 0; i < fleurs.size(); i++) {
                Fleur fleur = fleurs.get(i);
                System.out.println("Image Path: " + request.getContextPath() + fleur.getImages());
                if(i % 2 == 0) { 

    %>
    <div class="block-02">
    <% 
                } 
    %>
        <div class="image2">
            <div class="image-container1">
                <img src="<%=request.getContextPath() + fleur.getImages() %>" alt="<%= fleur.getNomFleur() %>" class="fleurImage">
            </div>
        </div>
        <% 
                // Fermer le block-02 après 2 images ou à la dernière image
                if (i % 2 == 1 || i == fleurs.size() - 1) { 
    %>
    </div>
    <%     
        }
            }
        } else { 
    %>
    <p>Aucune image disponible.</p>
    <% 
        } 
    %>
</div>

        </div>
    </div>
    <form class="search-bar" action="/search" method="GET">
        <img src="assets/image/Icon.svg" alt="Recherche" class="search-icon">
        <input type="text" name="query" placeholder="Rechercher...">
        <button type="submit">Chercher</button>
    </form>
    <div class="dropdown">
     <% 
            // Boucle pour afficher chaque nom de fleur dans le menu déroulant
            for (String categorie : categories) {
        %>
            <div class="dropdown-item"><%= categorie %></div>
        <% 
            }
        %>
      </div>
      <div class="allCategory">
      <p>Tout categorie</p>
    </div>
    <div class="scroll-content">
        <% 
            for (FleursCategories categoryFleur : FleurCategorie) {
        %>
            <div class="image-item">
                <img src="<%=request.getContextPath() + categoryFleur.getImages() %>"alt="Image 1">
                <div class="image-details">
                    <h4><%=categoryFleur.getNomFleur()%></h4>
                    <p><%=categoryFleur.getPrix() %> €</p>
                    <p><%=categoryFleur.getNomCategory() %></p>
                </div>
            </div>
            <% 
                }
             %>
    </div>
     <script src="assets/js/script.js"></script> 
    </body>
</html>