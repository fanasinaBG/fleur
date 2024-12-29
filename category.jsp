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
<%
    RequeteCategorie Category = new RequeteCategorie();
    HashMap<String,String> categories = Category.readCategorie();  // Appel de la méthode pour récupérer les catégories
    Fonction fonction = new Fonction();
// Récupérer l'ID de la fleur sélectionnée
        String id = request.getParameter("id"); 
        int idC=Integer.parseInt(id);
        List<FleursCategories> FleurCategorie = RequeteFleurCategorie.getFleurCategory(idC);
%>
<!DOCTYPE html>
<html>
<head>
  	<meta charset="utf-8">
  	<meta name="viewport" content="initial-scale=1, width=device-width">
  	
  	<link rel="stylesheet"  href="assets/css/category.css" />
  	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Playfair Display:wght@400&display=swap" />
  	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Open Sans:wght@400&display=swap" />
  	
  	
  	
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
                            <a href="login.html" style="text-decoration: none; color: inherit;">Se connecter</a>
                          </div>
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
    <form class="search-bar" action="/search" method="GET">
        <img src="assets/image/Icon.svg" alt="Recherche" class="search-icon">
        <input type="text" name="query" placeholder="Rechercher...">
        <button type="submit">Chercher</button>
    </form>
   <div class="dropdown">
     <% 
        
            for (Map.Entry<String, String> categorie : categories.entrySet()) {
                String key = categorie.getKey(); // Clé
                String value = categorie.getValue(); // Valeur
     %>
                <div class="dropdown-item">
                    <a href="category.jsp?id=<%=key %>"><%= value %> </a> 
                </div>
        <%      

            }
        %>
            
      </div>
      <div class="allCategory">
      <p>Tout categorie</p>
    </div>
  	
  	<div class="content">
    		<div class="block-01">
            <% 
               for (FleursCategories categoryFleur : FleurCategorie) {
            %>
      			<div class="image">
                    <div class="image-container1">
                        <img src="<%=request.getContextPath() + categoryFleur.getImages() %>"alt="Image 1" class="fleurImage">
                    </div>  
      			</div>
                <%
                    }
                %>
      			
    		</div>
  	</div>  	
</body>
</html>