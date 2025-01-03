package fleur;

import connection.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import fleur.FleursCategories;

public class RequeteFleurCategorie {
    public static List<FleursCategories>  fleurCategory() {
        List<FleursCategories> FleurCategorie= new ArrayList<>();
        String query = "SELECT * FROM vue_fleurs_categories";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            // Parcourir les résultats
            while (resultSet.next()) {
                int fleur_id = resultSet.getInt("fleur_id");
                String nomFleur = resultSet.getString("nomFleur");
                int prix = resultSet.getInt("prix");
                String descriptions = resultSet.getString("descriptions");
                String images = resultSet.getString("images");
                int categoryId = resultSet.getInt("category_id");
                int quantite = resultSet.getInt("quantite");
                String nomCategory = resultSet.getString("nomCategory");
                FleursCategories fleur = new FleursCategories(fleur_id,nomFleur, prix ,descriptions, images,nomCategory,quantite );
                FleurCategorie.add(fleur);

                // Afficher les données (ou les traiter selon vos besoins)
                System.out.println("Nom Fleur: " + nomFleur);
                System.out.println("Prix: " + prix);
                System.out.println("Descriptions: " + descriptions);
                System.out.println("Images: " + images);
                System.out.println("Category ID: " + categoryId);
                System.out.println("Nom Category: " + nomCategory);
                System.out.println("quantite: " + quantite);
                System.out.println("----------------------------");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return FleurCategorie;
    }
    // public List<String> getFleur( int id){
    //     List<String> listEvent= new ArrayList<>();
    //     String sql = "SELECT nomFleur,prix,descriptions,images,nomCategory FROM vue_fleurs_categories WHERE category_id =? ";
    //     try (Connection conn = DatabaseConnection.getConnection();
    //          PreparedStatement stmt = conn.prepareStatement(sql)) {
    //             ResultSet resultSet = stmt.executeQuery();

    //             while (resultSet.next()) {
    //                 int fleur_id = resultSet.getInt("fleur_id");
    //                 String nomFleur = resultSet.getString("nomFleur");
    //                 int prix = resultSet.getInt("prix");
    //                 String descriptions = resultSet.getString("descriptions");
    //                 String images = resultSet.getString("images");
    //                 int categoryId = resultSet.getInt("category_id");
    //                 String nomCategory = resultSet.getString("nomCategory");

    //                 listEvent.add(fleur_id,nomFleur, prix ,descriptions, images,nomCategory);
    //                 System.out.println("Nom de l'evenement: " + nomEvent);
    //             }
    //          }
    //          catch(SQLException e){
    //             System.out.println("Erreur de lecture" + e.getMessage());
    //          }
    //          return listEvent;
    // }

    public static List<FleursCategories>  getFleurCategory( int id) {
        List<FleursCategories> FleurCategorie= new ArrayList<>();
        String query = "SELECT fleur_id,nomFleur,prix,descriptions,images,nomCategory , category_id FROM vue_fleurs_categories WHERE category_id=?";

      
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
             preparedStatement.setInt(1, id);

             try(ResultSet resultSet = preparedStatement.executeQuery()) {

            // Parcourir les résultats
            while (resultSet.next()) {
                int fleur_id = resultSet.getInt("fleur_id");
                String nomFleur = resultSet.getString("nomFleur");
                int prix = resultSet.getInt("prix");
                String descriptions = resultSet.getString("descriptions");
                String images = resultSet.getString("images");
                int categoryId = resultSet.getInt("category_id");
                String nomCategory = resultSet.getString("nomCategory");
                FleursCategories fleur = new FleursCategories(fleur_id,nomFleur, prix ,descriptions, images,nomCategory );
                FleurCategorie.add(fleur);

                // Afficher les données (ou les traiter selon vos besoins)
                System.out.println("id fleur: " + fleur_id);
                System.out.println("Nom Fleur: " + nomFleur);
                System.out.println("Prix: " + prix);
                System.out.println("Descriptions: " + descriptions);
                System.out.println("Images: " + images);
                System.out.println("Category ID: " + categoryId);
                System.out.println("Nom Category: " + nomCategory);
                System.out.println("----------------------------");
            }
        } 
    }catch (Exception e) {
        e.printStackTrace();
    }
    return FleurCategorie;
}
public static List<FleursCategories> searchFleurCategory(String searchQuery) {
    List<FleursCategories> FleurCategorie = new ArrayList<>();
    String query = "SELECT nomFleur, nomCategory FROM vue_fleurs_categories WHERE nomFleur LIKE ? LIMIT 5";

    System.out.println("Méthode searchFleurCategory appelée avec : " + searchQuery);

    try (Connection connection = DatabaseConnection.getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(query)) {
        
        preparedStatement.setString(1, searchQuery + "%"); // Recherche dynamique
        try (ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                String nomFleur = resultSet.getString("nomFleur");
                String nomCategory = resultSet.getString("nomCategory");

                // Ajout des résultats à la liste (ajustez selon votre classe FleursCategories)
                FleursCategories fleur = new FleursCategories();
                fleur.setNomFleur(nomFleur);
                fleur.setNomCategory(nomCategory);
                FleurCategorie.add(fleur);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return FleurCategorie;
}

public static List<FleursCategories>  getFleurQuantite( int id) {
    List<FleursCategories> FleurCategorie= new ArrayList<>();
    String query = "SELECT fleur_id,nomFleur,prix,descriptions,images,nomCategory , category_id ,quantite FROM vue_fleurs_categories WHERE fleur_id=?";

  
    try (Connection connection = DatabaseConnection.getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(query)) {
         preparedStatement.setInt(1, id);

         try(ResultSet resultSet = preparedStatement.executeQuery()) {

        // Parcourir les résultats
        while (resultSet.next()) {
            int fleur_id = resultSet.getInt("fleur_id");
            String nomFleur = resultSet.getString("nomFleur");
            int prix = resultSet.getInt("prix");
            String descriptions = resultSet.getString("descriptions");
            String images = resultSet.getString("images");
            int categoryId = resultSet.getInt("category_id");
            String nomCategory = resultSet.getString("nomCategory");
            int quantite = resultSet.getInt("quantite");
            FleursCategories fleur = new FleursCategories(fleur_id,nomFleur, prix ,descriptions, images,nomCategory ,quantite);
            FleurCategorie.add(fleur);

            // Afficher les données (ou les traiter selon vos besoins)
            System.out.println("id fleur: " + fleur_id);
            System.out.println("Nom Fleur: " + nomFleur);
            System.out.println("Prix: " + prix);
            System.out.println("Descriptions: " + descriptions);
            System.out.println("Images: " + images);
            System.out.println("quantite: " + quantite);
            System.out.println("Nom Category: " + nomCategory);
            System.out.println("----------------------------");
        }
    } 
}catch (Exception e) {
    e.printStackTrace();
}
return FleurCategorie;
}


    public static void main(String[]args){
        RequeteFleurCategorie category=new RequeteFleurCategorie();
        int id=3;
        // String parametre= "Coquelicots";
        // List<FleursCategories> results = RequeteFleurCategorie.searchFleurCategory("Coquelicots");
        // for (FleursCategories fleur : results) {
        //     System.out.println(fleur.getNomFleur() + " - " + fleur.getNomCategory());
        // }
        // System.out.println("Fin du test de searchFleurCategory.");
        //category.getFleurCategory(id);
         category.fleurCategory();
        //category.getFleurQuantite(id);

    } 
}

