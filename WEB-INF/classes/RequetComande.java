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
                int prixTotal = resultSet.getInt("prixTotal");
                int id = resultSet.getInt("id");
                int prixUnitaire = resultSet.getInt("prixUnitaire");
                String quantite = resultSet.getString("quantite");
                Commande coms = new Commande(id ,nomProduit , personne,quantite,prixTotal,prixUnitaire);
                commande.add(coms);

                // Afficher les données (ou les traiter selon vos besoins)
                System.out.println("id: " + id);
                System.out.println("nomProduit: " + nomProduit);
                System.out.println("personne: " + personne);
                System.out.println("prixTotal: " + prixTotal);
                System.out.println("prixUnitaire: " + prixUnitaire);
                System.out.println("quantite: " + quantite);
                System.out.println("----------------------------");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return commande;
    }

    public void createCommande(String nomProduit,String personne,String quantite,int prixTotal,int prixUnitaire){
        String sql = "INSERT INTO commande (nomProduit,personne,quantite,prixTotal,prixUnitaire) VALUES (?,?,?,?,?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1,nomProduit);
                stmt.setString(2,personne);
                stmt.setString(3,quantite);
                stmt.setInt(4,prixTotal);
                stmt.setInt(5,prixUnitaire);

                stmt.executeUpdate();  
             }
             catch(SQLException e){
                System.out.println("Erreur d'ajout" + e.getMessage());
             }
    }
    public Commande getCommandeById(int idRecherche) {
        Commande commande = null;
        String query = "SELECT * FROM commande WHERE id = ?";
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, idRecherche);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    String nomProduit = resultSet.getString("nomProduit");
                    String personne = resultSet.getString("personne");
                    int prixTotal = resultSet.getInt("prixTotal");
                    int prixUnitaire = resultSet.getInt("prixUnitaire");
                    String quantite = resultSet.getString("quantite");
                    commande=  new Commande (idRecherche, nomProduit, personne, quantite, prixTotal, prixUnitaire);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return commande;
    }

    public void deleteCommande(int id) {
        String sql = "DELETE FROM commande WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Erreur lors de la suppression : " + e.getMessage());
        }
    }
    

    public static void main(String []args){
        RequetComande command = new RequetComande();
        command.getCommande();
    }
}
