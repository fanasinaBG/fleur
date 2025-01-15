<!DOCTYPE html>
<html>
<head>
    <title>Ajouter une fleur</title>
</head>
<body>
    <h1>Information</h1>
    <form action="Traitement/ajouterFleur.jsp" method="post">
                
        <label for="categorie">Produit :</label>
        <select id="categorie" name="categorie">
            <option value=""> Selectionner un produit </option>
            <option value="marguerite">Marguerite</option>
            <option value="tulipe">Tulipe</option>
            <option value="narcisse">Narcisse</option>
            <option value="petunia">Pétunia</option>
            <option value="lavande">Lavande</option>
            <option value="lys">Lys</option>
        </select>
        <br><br>
        
        <label for="descri">Date de debut :</label>
        <input type="text" id="dateDebut" name="dateDebut"><br><br>

        <label for="nbr">Date de fin :</label>
        <input type="text" id="dateFin" name="dateFin"><br><br>

        <label for="nbr">Reduction :</label>
        <input type="text" id="dateFin" name="dateFin"><br><br>
       
        <button type="submit">Envoyer</button>
    </form>
</body>
</html>
