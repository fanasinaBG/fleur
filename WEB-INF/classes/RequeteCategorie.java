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

    public static void main(String[] args){
        RequeteCategorie categorie = new RequeteCategorie();
    
        // String nomCategorie = "test";
    
        String nomCategorie = "vaovao";
        int id = 7;
        
        Categorie category = new Categorie(id, nomCategorie);
        // categorie.createCategorie(category);
        categorie.updateCategorie(category);

    }
    
}

