package vente;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import connection.DatabaseConnection;
import java.sql.Date;

public class RequetteVente {
    public void createLivraison(Vente vente) {
        String sql = "INSERT INTO Vente (idClient, idFleur,dateVente) VALUES (?,?,?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt (1, vente.getIdClient());
            stmt.setInt(2, vente.getIdFleur());
            stmt.setDate(3, vente.getDateVente());
            int rowsAffected = stmt.executeUpdate();
         // Vérifiez si des lignes ont été insérées
         if (rowsAffected > 0) {
            System.out.println("Insertion réussie.");
        } else {
            System.out.println("Aucune ligne insérée.");
        }
    } catch (SQLException e) {
        System.out.println("Erreur lors de la création : " + e.getMessage());
    }
    
    }
    public void insertVente(int idClient, int idFleur,Date vente) {
        String sql = "INSERT INTO vente (idClient, idFleur,dateVente) VALUES (?, ?,?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            // Définir les paramètres de la requête
            stmt.setInt(1, idClient);  // idMpividy
            stmt.setInt(2, idFleur);   // idFleur
            stmt.setDate(3, vente);  

            // Exécuter la requête d'insertion
            int rowsAffected = stmt.executeUpdate();
            
            // Vérifier si des lignes ont été insérées
            if (rowsAffected > 0) {
                System.out.println("Insertion réussie.");
            } else {
                System.out.println("Aucune ligne insérée.");
            }
        } catch (SQLException e) {
            System.out.println("Erreur lors de l'insertion : " + e.getMessage());
        }
    }
}
