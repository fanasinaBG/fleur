package promotion;

import connection.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import fleur.Fleur;
import promotion.Promotion;
import promotion.PromFleur;

public class RequetePromotion {
    public static List<PromFleur>  fleurPromotion() {
        List<PromFleur> promotion= new ArrayList<>();
        String query = "SELECT * FROM vue_fleurs_promotions";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            // Parcourir les résultats
            while (resultSet.next()) {
                int fleur_id = resultSet.getInt("id_fleur");
                String nomFleur = resultSet.getString("nomFleur");
                int prix = resultSet.getInt("prix");
                String images = resultSet.getString("images");
                int promo = resultSet.getInt("promotion");
                int quantite = resultSet.getInt("quantite");
                String dateFin = resultSet.getString("dateFin");
                PromFleur promos = new PromFleur(fleur_id,nomFleur, prix , images,promo,dateFin );
                promotion.add(promos);

                // Afficher les données (ou les traiter selon vos besoins)
                System.out.println("Nom Fleur: " + nomFleur);
                System.out.println("Prix: " + prix);
                // System.out.println("Descriptions: " + descriptions);
                System.out.println("Images: " + images);
                // System.out.println("Category ID: " + categoryId);
                // System.out.println("Nom Category: " + nomCategory);
                System.out.println("quantite: " + quantite);
                System.out.println("----------------------------");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return promotion;
    }
    public void createPromotion(Promotion promotion) {
        String sql = "INSERT INTO promotion (idFleur, promotion, dateFin, dateDebut) VALUES (?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, promotion.getIdFleur());          // Paramètre 1 : idFleur
            stmt.setInt(2, promotion.getPromotion());        // Paramètre 2 : promotion
            stmt.setString(3, promotion.getDateFin());       // Paramètre 3 : dateFin
            stmt.setString(4, promotion.getDateDebut());     // Paramètre 4 : dateDebut
            
            stmt.executeUpdate();  // Exécution de la requête d'insertion
        } catch (SQLException e) {
            System.out.println("Erreur lors de la création : " + e.getMessage());
        }
    }

    public void insertPromotion(String startDate, String endDate, String promo, String fleurId) {
        // Convertir les valeurs des paramètres en types appropriés
        int idFleur = Integer.parseInt(fleurId); 
        int proms = Integer.parseInt(promo);

        // Définir la requête SQL pour l'insertion
        String sql = "INSERT INTO promotion (idFleur, promotion, dateFin, dateDebut) VALUES (?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection(); // Obtenir la connexion à la base de données
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Préparer la requête avec les paramètres
            stmt.setInt(1, idFleur);  // Paramètre 1 : idFleur
            stmt.setInt(2, proms);     // Paramètre 2 : promotion
            stmt.setString(3, endDate);  // Paramètre 3 : dateFin
            stmt.setString(4, startDate); // Paramètre 4 : dateDebut

            // Exécuter la requête d'insertion
            stmt.executeUpdate();

            // Afficher un message de succès (ou vous pouvez rediriger l'utilisateur vers une autre page)
            System.out.println("Promotion insérée avec succès.");
        } catch (SQLException e) {
            // En cas d'erreur, afficher un message d'erreur
            System.out.println("Erreur lors de l'insertion de la promotion : " + e.getMessage());
        }
    }
    

    public  static void main(String[]args){
        RequetePromotion pro= new RequetePromotion();
        pro.fleurPromotion();
    }
}