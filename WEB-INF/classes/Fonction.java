package fleur;

import connection.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


import fleur.FleursCategories;


public class Fonction {
    public List<Fleur>  fetchFleursCategories() {
        List<Fleur> fleurs= new ArrayList<>();
        String query = "SELECT * FROM vue_fleurs_categories";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            // Parcourir les résultats
            while (resultSet.next()) {
                String nomFleur = resultSet.getString("nomFleur");
                int prix = resultSet.getInt("prix");
                
                // String descriptions = resultSet.getString("descriptions");
                String images = resultSet.getString("images");
                int categoryId = resultSet.getInt("category_id");
                // String nomCategory = resultSet.getString("nomCategory");
                Fleur fleur = new Fleur(nomFleur, prix, categoryId, images );
                fleurs.add(fleur);

                // Afficher les données (ou les traiter selon vos besoins)
                System.out.println("Nom Fleur: " + nomFleur);
                System.out.println("Prix: " + prix);
                // System.out.println("Descriptions: " + descriptions);
                System.out.println("Images: " + images);
                System.out.println("Category ID: " + categoryId);
                //System.out.println("Nom Category: " + nomCategory);
                System.out.println("----------------------------");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fleurs;
    }

    public List<Fleur>  fetchsCategories() {
        List<Fleur> fleurs= new ArrayList<>();
        String query = "SELECT * FROM fleur";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            // Parcourir les résultats
            while (resultSet.next()) {
                String nomFleur = resultSet.getString("nomFleur");
                int id = resultSet.getInt("id");

                Fleur fleur = new Fleur(id,nomFleur );
                fleurs.add(fleur);

                // Afficher les données (ou les traiter selon vos besoins)
    
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return fleurs;
    }

    public Fleur searchFleur(String fleur) {
        String query = "SELECT * FROM vue_fleurs_categories WHERE nomFleur LIKE ?";
        Fleur foundFleur = null;

        try (Connection connection = DatabaseConnection.getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(query)) {

        // Paramètre pour la recherche
        preparedStatement.setString(1, "%" + fleur + "%");

        try (ResultSet resultSet = preparedStatement.executeQuery()) {
            // Vérifie si des résultats existent
            if (resultSet.next()) {
                String nomFleur = resultSet.getString("nomFleur");
                int prix = resultSet.getInt("prix");
                String descriptions = resultSet.getString("descriptions");
                String images = resultSet.getString("images");
                int categoryId = resultSet.getInt("category_id");
                
                // Crée l'objet Fleur
                foundFleur = new Fleur(nomFleur, prix, categoryId, descriptions, images);

                // Facultatif : Afficher les données récupérées
                System.out.println("Nom Fleur: " + nomFleur);
                System.out.println("Prix: " + prix);
                System.out.println("Descriptions: " + descriptions);
                System.out.println("Images: " + images);
                System.out.println("Category ID: " + categoryId);
                System.out.println("----------------------------");
            } else {
                System.out.println("Aucune fleur trouvée pour : " + fleur);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return foundFleur;
    }

    // Mélanger les fleurs
    public List<Fleur> shuffleFleursCategories(List<Fleur> fleurs) {
        Collections.shuffle(fleurs);
        return fleurs;
    }

    // Obtenir les fleurs mélangées
    public List<Fleur> getShuffledFleurs(int limit) {
        List<Fleur> fleurs = fetchFleursCategories();
         shuffleFleursCategories(fleurs);


        // Limiter la liste au nombre spécifié
        return fleurs.size() > limit ? fleurs.subList(0, limit) : fleurs;
    }

    public void createFleur(Fleur fleur) {
        String sql = "INSERT INTO fleur (nomFleur, prix) VALUES (?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, fleur.getNomFleur());
            stmt.setInt(2, fleur.getPrix());
            
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Erreur lors de la création : " + e.getMessage());
        }
    }

    public void updateFleur(Fleur fleur) {
        String sql = "UPDATE fleur SET nomFleur = ?, prix = ? WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, fleur.getNomFleur());
            stmt.setDouble(2, fleur.getPrix());
            stmt.setInt(3, fleur.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Erreur lors de la mise à jour : " + e.getMessage());
        }
        
    }

    public void updateQuantiteFleur(Fleur fleur) {
        String sql = "UPDATE fleur SET quantite = ? WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, fleur.getQuantite());
            stmt.setInt(2, fleur.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Erreur lors de la mise à jour : " + e.getMessage());
        }
        
    }

    public void deleteFleur(int id) {
        String sql = "DELETE FROM fleur WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Erreur lors de la suppression : " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        Fonction view = new Fonction();

        view.fetchFleursCategories();
        
        // String nom = "Chainse";
        // int prix = 50;
        // int id = 32;
        // int limit=3;
        // view.getShuffledFleurs(limit);

        // //Fleur fleur = new Fleur(id);
        // view.deleteFleur(id);
        // System.out.println("Fleur delete avec succès !");

        // Fleur fleur = new Fleur(nom, prix);
        // view.createFleur(fleur);
        // System.out.println("Fleur ajouté avec succès !");


        
    }
}
