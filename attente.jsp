<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
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
    
    <% String nom = (String) session.getAttribute("nom"); 
        String fleur = (String) session.getAttribute("fleurNom") ;

    %>
    <p><%= nom%> vous avez commander <%= fleur%></p>
    <p>avec prix <%=session.getAttribute("fleurPrix")%> €</p>
</body>
</html>