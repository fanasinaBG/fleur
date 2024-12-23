package fleur;

import connection.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class Fonction {
    public List<String> fetchFleursCategories() {
        List<String> fleurs= new ArrayList<>();
        String query = "SELECT * FROM vue_fleurs_categories";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            // Parcourir les résultats
            while (resultSet.next()) {
                String nomFleur = resultSet.getString("nomFleur");
                double prix = resultSet.getDouble("prix");
                String descriptions = resultSet.getString("descriptions");
                String images = resultSet.getString("images");
                int categoryId = resultSet.getInt("category_id");
                String nomCategory = resultSet.getString("nomCategory");
                fleurs.add(nomFleur + prix + descriptions + images + categoryId + nomCategory + nomCategory);

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
        return fleurs;
    }

    public static void main(String[] args) {
        Fonction view = new Fonction();
        view.fetchFleursCategories();
    }
}
