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
                String nomCategory = resultSet.getString("nomCategory");
                FleursCategories fleur = new FleursCategories(fleur_id,nomFleur, prix ,descriptions, images,nomCategory );
                FleurCategorie.add(fleur);

                // Afficher les données (ou les traiter selon vos besoins)
                System.out.println("Nom Fleur: " + nomFleur);
                System.out.println("Prix: " + prix);
                System.out.println("Descriptions: " + descriptions);
                System.out.println("Images: " + images);
                System.out.println("Category ID: " + categoryId);
                System.out.println("Nom Category: " + nomCategory);
                System.out.println("----------------------------");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return FleurCategorie;
    }
    public List<String> getFleur( int id){
        List<String> listEvent= new ArrayList<>();
        String sql = "SELECT nomFleur,prix,descriptions,images,nomCategory FROM vue_fleurs_categories WHERE category_id =? ";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
                ResultSet resultSet = stmt.executeQuery();

                while (resultSet.next()) {
                    int fleur_id = resultSet.getInt("fleur_id");
                    String nomFleur = resultSet.getString("nomFleur");
                    int prix = resultSet.getInt("prix");
                    String descriptions = resultSet.getString("descriptions");
                    String images = resultSet.getString("images");
                    int categoryId = resultSet.getInt("category_id");
                    String nomCategory = resultSet.getString("nomCategory");

                    listEvent.add(fleur_id,nomFleur, prix ,descriptions, images,nomCategory);
                    System.out.println("Nom de l'evenement: " + nomEvent);
                }
             }
             catch(SQLException e){
                System.out.println("Erreur de lecture" + e.getMessage());
             }
             return listEvent;
    }

    public static void main(String[]args){
        RequeteFleurCategorie category=new RequeteFleurCategorie();
        category.fleurCategory();
    } 
}

