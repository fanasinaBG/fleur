<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="fleur.Fonction" %>
<%@ page import="connection.DatabaseConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Paneau</title>
</head>
<body>

    <h2>Formulaire d'adress</h2>
    <form action="liste.jsp" method="post">
        <label for="adress">votre adress :</label>
        <input type="text" id="adress" name="adress" required><br><br>
        <input type="submit" name="save" value="Envoye">
</form>
</body>
</html>