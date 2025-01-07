<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="commande.Commande" %>
<%@ page import="commande.RequetComande" %>
<%@ page import="connection.DatabaseConnection" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="fleur.FleursCategories" %>
<%@ page import="fleur.RequeteFleurCategorie" %>
<%@ page import="fleur.Fleur" %>
<%@ page import="fleur.Fonction" %>
<%@ page import="livraison.RequeteLivraison" %>
<%@ page import="livraison.Livraison" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
     <% 
        String idParam = request.getParameter("id");
        //String idC=(String) session.getAttribute("idClient");
        //int idClient=Integer.parseInt(idC);
        int id= Integer.parseInt(idParam);
        RequeteLivraison livraison= new RequeteLivraison();
        RequetComande requetCommande= new RequetComande();
        Commande commande = requetCommande.getCommandeById(id);
        RequeteFleurCategorie category=new RequeteFleurCategorie();
        Fonction fleures= new Fonction();
        List<FleursCategories> fleur = category.fleurCategory();

        for (FleursCategories fleurs : fleur) { 
                if (fleurs.getFleur_id() == id) {
                    if(fleurs.getQuantite() >= Integer.parseInt(commande.getQuantite()) ){
                        
                        int quantite= fleurs.getQuantite() - Integer.parseInt(commande.getQuantite());
                        int ids=fleurs.getFleur_id();
                        Fleur vonikazo = new Fleur(ids, quantite);
                        requetCommande.deleteCommande(id);
                        fleures.updateQuantiteFleur(vonikazo);
                        out.println("supression reussi");

                        int prixUnitaire=fleurs.getPrix();
                        int prixTotal= commande.getPrixTotal();
                        String quantites= commande.getQuantite();
                        String personne= commande.getPersonne();
                        String vonikaz=fleurs.getNomFleur();

                        Livraison livraisonObj = new Livraison();
                            livraisonObj.setClient(personne);
                            livraisonObj.setNomProduit(vonikaz);
                            livraisonObj.setQuantite(quantites);
                            livraisonObj.setPrixTotal(prixTotal);
                            livraisonObj.setPrixUnitaire(prixUnitaire);

                        livraison.createLivraison(livraisonObj);
                        response.sendRedirect("../homeAdmin.jsp");
                    }
                    else{
                         out.println("votre quantiter de stock est faible");
                    }
                    break;
                }
            }
        %>
        <p>id: <%= id%></p>

</body>
</html>