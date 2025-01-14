<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion Administrateur</title>
</head>
<body>
    <h2>Connexion Administrateur</h2>
    <form action="Traitement/logAd.jsp" method="post">
        <label for="username">Adresse e-mail :</label>
        <input type="text" id="email" name="email" required><br><br>
        <label for="password">Mot de passe :</label>
        <input type="password" id="password" name="password" required><br><br>
        <button type="submit">Se connecter</button>
    </form>
</body>
</html>
