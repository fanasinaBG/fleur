<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="fleur.Fonction" %>
<%@ page import="connection.DatabaseConnection" %>
<%@ page import="categorie.RequeteCategorie" %>
<%
    // Créer une instance de votre DAO et récupérer la liste des catégories
    RequeteCategorie Category = new RequeteCategorie();
    List<String> categories = Category.readCategorie();  // Appel de la méthode pour récupérer les catégories
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
                        <div class="contact">Contact</div>
                    </div>
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
        <div class="block-02">
        <div class="image2">
        <div class="image-container1">
        </div>
        </div>
        <div class="image2">
        <div class="image-container1">
        </div>
        </div>
        </div>
        <div class="block-02">
            <div class="image2">
            <div class="image-container1">
            </div>
            </div>
            <div class="image2">
            <div class="image-container1">
            </div>
            </div>
            </div>
        <div class="block-02">
        <div class="image2">
        <div class="image-container1">
        </div>
        </div>
        <div class="image2">
        <div class="image-container1">
        </div>
        </div>
        </div>
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
    
    		</body>
</html>