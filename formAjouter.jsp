<!DOCTYPE html>
<html>
<head>
    <title>Ajouter une fleur</title>
</head>
<body>
    <h1>Information</h1>
    <form action="ajouterFleur.jsp" method="post">
        <label for="nom">Nom :</label>
        <input type="text" id="nom" name="nom"><br><br>

        <label for="prix">Prix :</label>
        <input type="text" id="prix" name="prix"><br><br>

        <label for="descri">Description :</label>
        <input type="text" id="descri" name="descri"><br><br>

        <label for="nbr">Quantite :</label>
        <input type="number" id="nbr" name="nbr" min="0"><br><br>

        <label for="categorie">Categorie :</label>
        <select id="categorie" name="categorie">
            <option value="">-- Selectionnez une categorie --</option>
            <option value="sauvage">Fleurs sauvages</option>
            <option value="jardin">Fleurs de jardin</option>
            <option value="exotique">Fleurs exotiques</option>
            <option value="bulbe">Fleurs à bulbe</option>
            <option value="annuelle">Fleurs annuelles</option>
            <option value="vivace">Fleurs vivaces</option>
        </select>
        <br><br>

        <button type="submit">Envoyer</button>
    </form>
</body>
</html>
