package categorie;

import connection.DatabaseConnection;
import fleur.Categorie;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale.Category;

import client.Clients;

public class RequeteCategorie {
    public void createCategorie(Categorie categorie){
        String sql = "INSERT INTO category (nomCategory) VALUES (?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1,categorie.getNomCategory());

                stmt.executeUpdate();  
             }
             catch(SQLException e){
                System.out.println("Erreur d'ajout" + e.getMessage());
             }
    }

    public void updateCategorie(Categorie categorie){
        String sql = "UPDATE category SET nomCategory = ? WHERE id=?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {    
                stmt.setString(1, categorie.getNomCategory());  
                stmt.setInt(2, categorie.getId());    
                stmt.executeUpdate();  
             }
             catch(SQLException e){
                System.out.println("Erreur" + e.getMessage());
             }
    }

    public List<String> readCategorie(){
        List<String> listCategorie= new ArrayList<>();
        String sql = "SELECT * FROM category ";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
                ResultSet resultSet = stmt.executeQuery();

                while (resultSet.next()) {
                    String nomCategorie = resultSet.getString("nomCategory");
                    int id = resultSet.getInt("id");

                    listCategorie.add(id,nomCategorie);

                    System.out.println("Nom Categorie: " + nomCategorie);
                    System.out.println("id Categorie: " + id);
                }

             }
             catch(SQLException e){
                System.out.println("Erreur" + e.getMessage());
             }
             return listCategorie;
    }

    public void deleteCategorie(int id){
        String sql = "DELETE FROM Category WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {    
                stmt.setInt(1, id);    
                stmt.executeUpdate();  
             }
             catch(SQLException e){
                System.out.println("Erreur de suppression" + e.getMessage());
             }
    }

    public static void main(String[] args){
        RequeteCategorie categorie = new RequeteCategorie();
    
        // String nomCategorie = "test";
    
        // String nomCategorie = "vaovao";
        //int id = 7;
        
        // Categorie category = new Categorie(id, nomCategorie);
        // categorie.createCategorie(category);
        // categorie.updateCategorie(category);
        System.out.println("test" );
         categorie.readCategorie();
        //categorie.deleteCategorie(id);
    }
    
}

