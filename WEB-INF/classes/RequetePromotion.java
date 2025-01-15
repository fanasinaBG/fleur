package promotion;

import connection.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import fleur.Fleur;
import promotion.Promotion;

public class RequetePromotion {
    public static List<Promotion>  fleurCategory() {
        List<Promotion> promotion= new ArrayList<>();
        String query = "SELECT * FROM vue_fleurs_promotions";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            // Parcourir les résultats
            while (resultSet.next()) {
                int fleur_id = resultSet.getInt("id_fleur");
                String nomFleur = resultSet.getString("nomFleur");
                int prix = resultSet.getInt("prix");
                // String descriptions = resultSet.getString("descriptions");
                String images = resultSet.getString("images");
                int promo = resultSet.getInt("promotion");
                int quantite = resultSet.getInt("quantite");
                String dateFin = resultSet.getString("dateFin");
                Promotion promos = new Promotion(fleur_id,nomFleur, prix , images,nomCategory,quantite );
                promotion.add(promos);

                // Afficher les données (ou les traiter selon vos besoins)
                System.out.println("Nom Fleur: " + nomFleur);
                System.out.println("Prix: " + prix);
                // System.out.println("Descriptions: " + descriptions);
                System.out.println("Images: " + images);
                System.out.println("Category ID: " + categoryId);
                System.out.println("Nom Category: " + nomCategory);
                System.out.println("quantite: " + quantite);
                System.out.println("----------------------------");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return promotion;
    }
    public void createPromotion(Promotion promotion) {
        String sql = "INSERT INTO promotion (idFleur, promotion,dateFin) VALUES (?,?,?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString (1, promotion.getClient());
            stmt.setString(2, livrer.getNomProduit());
            stmt.setString(3, livrer.getQuantite());
            stmt.setInt(4, livrer.getPrixTotal());
            stmt.setInt(5, livrer.getPrixUnitaire());
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Erreur lors de la création : " + e.getMessage());
        }
    
    }
}