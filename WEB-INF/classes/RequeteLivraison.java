package livraison;

import connection.DatabaseConnection;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import livraison.Livraison;

public class RequeteLivraison {
    public List<Livraison> getLivraison(){
        List<Livraison> livraisons= new ArrayList<>();
        String query = "SELECT * FROM Livraison";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            // Parcourir les résultats
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String idClient = resultSet.getString("Client");
                String nomProduit = resultSet.getString("nomProduit");
                String quantite = resultSet.getString("quantite");
                int prixTotal = resultSet.getInt("prixTotal");
                int prixUnitaire = resultSet.getInt("prixUnitaire");
                int idConfirmation = resultSet.getInt("idConfirmation");
                Livraison livraison = new Livraison(id,idClient,nomProduit,quantite, prixTotal,prixUnitaire,idConfirmation);
                livraisons.add(livraison);

                // Afficher les données (ou les traiter selon vos besoins)
                System.out.println("le id est: " + id);
                System.out.println("idClient: " + idClient);
                System.out.println("----------------------------");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return livraisons;
    }
    public void createLivraison(Livraison livrer) {
        String sql = "INSERT INTO Livraison (Client, nomProduit,quantite,prixTotal,prixUnitaire) VALUES (?,?,?,?,?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString (1, livrer.getClient());
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
