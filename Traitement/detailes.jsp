<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="client.RequeteClient" %>
<%@ page import="connection.DatabaseConnection" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%
        int quantite = request.getParameter("tige");
        
        if (quantite == null){
            %>  
            <p> votre quantiter est vide</p>
    <%              
        }
        else {
            %>
             <p> votre quantiter pas vide</p>
     <%         
        }
    %>
</body>
</html>