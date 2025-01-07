package commande;

import commande.Commande;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale.Category;
import connection.DatabaseConnection;


public class RequetComande {
    public  List<Commande>  getCommande(){
        List<Commande> commande= new ArrayList<>();
        String query = "SELECT * FROM commande";

          try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            // Parcourir les résultats
            while (resultSet.next()) {
                String nomProduit = resultSet.getString("nomProduit");
                String personne = resultSet.getString("personne");
                int prix = resultSet.getInt("prix");
                String quantite = resultSet.getString("quantite");
                Commande coms = new Commande(nomProduit , personne,quantite,prix );
                commande.add(coms);

                // Afficher les données (ou les traiter selon vos besoins)
                System.out.println("nomProduit: " + nomProduit);
                System.out.println("personne: " + personne);
                System.out.println("prix: " + prix);
                System.out.println("quantite: " + quantite);
                System.out.println("----------------------------");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return commande;
    }

    public void createCommande(String nomProduit,String personne,String quantite,int prix){
        String sql = "INSERT INTO commande (nomCategory,personne,quantite,prix) VALUES (?,?,?,?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1,nomProduit);
                stmt.setString(2,personne);
                stmt.setString(3,quantite);
                stmt.setInt(4,prix);

                stmt.executeUpdate();  
             }
             catch(SQLException e){
                System.out.println("Erreur d'ajout" + e.getMessage());
             }
    }
}
