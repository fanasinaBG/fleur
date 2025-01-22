package vente;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import connection.DatabaseConnection;

public class RequetteVueVente {
    public List<VueVente> getLivraison() {
        List<VueVente> livraisons = new ArrayList<>();
        String query = "SELECT * FROM vue_ventes_completes";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            // Parcourir les résultats
            while (resultSet.next()) {
                int id_vente = resultSet.getInt("id_vente");
                String nom_client = resultSet.getString("nom_client");
                int id_fleur = resultSet.getInt("id_fleur");
                String nom_fleur = resultSet.getString("nom_fleur");
                int prix_fleur = resultSet.getInt("prix_fleur");
                String images_fleur = resultSet.getString("images_fleur");
                int id_Client = resultSet.getInt("id_Client");

                // Création de l'objet VueVente avec les résultats de la requête
                VueVente vente = new VueVente(id_vente, nom_client, id_fleur, nom_fleur, prix_fleur, images_fleur, id_Client);
                livraisons.add(vente);
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Capturer et afficher l'erreur si une exception SQL se produit
        }

        return livraisons;
    }

     // Fonction pour obtenir la somme des prix des fleurs pour chaque client
     public int getTotalPriceForClient(int idClient) {
        int totalPrice = 0;

        String sql = "SELECT SUM(prix_fleur) AS total_price "
                   + "FROM vue_ventes_completes "
                   + "WHERE id_Client = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Définir le paramètre idClient dans la requête
            stmt.setInt(1, idClient);

            // Exécuter la requête et récupérer le résultat
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                totalPrice = rs.getInt("total_price");
            }

        } catch (SQLException e) {
            System.out.println("Erreur lors de la récupération de la somme des prix : " + e.getMessage());
        }

        return totalPrice;
    }
}
