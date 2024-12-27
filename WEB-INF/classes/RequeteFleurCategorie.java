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
                String nomFleur = resultSet.getString("nomFleur");
                int prix = resultSet.getInt("prix");
                String descriptions = resultSet.getString("descriptions");
                String images = resultSet.getString("images");
                int categoryId = resultSet.getInt("category_id");
                String nomCategory = resultSet.getString("nomCategory");
                FleursCategories fleur = new FleursCategories(nomFleur, prix ,descriptions, images,categoryId,nomCategory );
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

    public static void main(String[]args){
        RequeteFleurCategorie category=new RequeteFleurCategorie();
        category.fleurCategory();
    } 
}

