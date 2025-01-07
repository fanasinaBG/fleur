<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="fleur.RequeteFleurCategorie" %>
<%@ page import="fleur.FleursCategories" %>

<%
    // Récupérer l'ID de la fleur sélectionnée
    String id = request.getParameter("id");

    List<FleursCategories> FleurCategorie = (List<FleursCategories>) session.getAttribute("FleurCategorie");
    if (FleurCategorie == null) {
        out.println("Aucune catégorie de fleur n'est disponible.");
        return;
    }
    FleursCategories selectedFleur = null;
    // Rechercher la fleur correspondante
    for (FleursCategories categoryFleur : FleurCategorie) { // Assurez-vous que FleurCategorie est disponible ici
        if (categoryFleur.getFleur_id() == Integer.parseInt(id)) {
            selectedFleur = categoryFleur;
            break;
        }
    }

    // Enregistrer les informations dans la session
    if (selectedFleur != null) {
        session.setAttribute("id", id);
        session.setAttribute("fleurImage", selectedFleur.getImages());
        session.setAttribute("fleurNom", selectedFleur.getNomFleur());
        session.setAttribute("fleurPrix", selectedFleur.getPrix());
        session.setAttribute("fleurDetails", selectedFleur.getNomCategory());
    }
%>


<!DOCTYPE html>
<html>
<head>
  	<meta charset="utf-8">
  	<meta name="viewport" content="initial-scale=1, width=device-width">
  	
  	<link rel="stylesheet"  href="assets/css/produit.css" />
  	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Playfair Display:wght@400;700&display=swap" />
  	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Open Sans:wght@400;600;700&display=swap" />
  	
  	
  	
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
                            <%
                                String nom = (String) session.getAttribute("nom");
                                if (nom != null) {
                            %>
                                <a href="Traitement/deconexion.jsp" style="text-decoration: none; color: inherit;">Se déconnecter</a>
                            <%
                                } else {
                            %>
                                <!-- Lien pour se connecter -->
                                <a href="login.jsp" style="text-decoration: none; color: inherit;">Se connecter</a>
                            <%
                                }
                            %>
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
  	
  	<div class="package">
    		<div class="heading">
      			<b class="special-package">Votre produit</b>
    		</div>
           <form action="Traitement/action.jsp" method="POST">
    <div class="block">
        <div class="main-block">
            <div class="image">
                <% if (selectedFleur != null) { %>
                <div class="image-container">
                    <img class="sary" alt="" src="<%=request.getContextPath() + session.getAttribute("fleurImage") %>">
                </div>
            </div>
            <div class="title-btn">
                <div class="title">
                    <div class="larkin-wood-full"><%=session.getAttribute("fleurNom") %></div>
                    <b class="b"> <%=session.getAttribute("fleurPrix") %> € pour 4 tiges</b>
                </div>
                <div class="tige">
                    <p>Vous voulez acheter combien de tiges ?</p>
                    <b class="description1"><%= session.getAttribute("idParam") %></b>
                    <input type="number" name="tige" placeholder="tige" required>
                </div>
                <div class="description">
                    <div class="description-cast-aluminum-container">
                        <p class="description">
                            <b class="description1"><%=session.getAttribute("fleurDetails") %></b>
                        </p>
                        <p class="cast-aluminum-outdoor">Cast Aluminum Outdoor Chaise Lounge As an elegant and classic touch to your outdoor space, this cast...</p>
                    </div>
                </div>
                <% } %>
                <div class="button-group">
                    <!-- Bouton Add to Cart -->
                    <button class="btn-add-to-cart" type="submit" name="action" value="addToCart">
                        <div class="text">
                            <div class="add-to-cart">Add to cart</div>
                            <div class="icon">
                                <img class="vector-icon1" alt="" src="Vector.svg">
                            </div>
                        </div>
                    </button>

                    <!-- Bouton Buy -->
                    <button class="achter" type="submit" name="action" value="buy">
                        <div class="text">
                            <div class="add-to-cart">Buy</div>
                            <div class="icon">
                                <img class="vector-icon1" alt="" src="Vector.svg">
                            </div>
                        </div>
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>
</div>
</body>
</html>