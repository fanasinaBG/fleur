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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <% 
        String id = request.getParameter("id");
        Fonction fleur = new Fonction();
        if(id != null){
            int ids= Integer.parseInt(id);
            fleur.deleteFleur(ids);
             out.println("votre fleur a ete suprimer");
             response.sendRedirect("../gestionFleur.jsp");
        }

    %>
</body>
</html>