import connection.DatabaseConnection;
import fleur.Categorie;
import fleur.Evenement;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale.Category;

public class RequeteEvent {
    public void createEvenement(Evenement event){
        String sql = "INSERT INTO evenement (nomEvenement) VALUES (?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1,event.getNomEvenement());

                stmt.executeUpdate();  
             }
             catch(SQLException e){
                System.out.println("Erreur d'ajout de l'évènement" + e.getMessage());
             }
    }

    public List<String> readEvent(){
        List<String> listCategorie= new ArrayList<>();
        String sql = "SELECT * FROM evenement ";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
                ResultSet resultSet = stmt.executeQuery();

                while (resultSet.next()) {
                    String nomEvent = resultSet.getString("nomEvenement");

                    listCategorie.add(nomEvent);
                    System.out.println("Nom de l'evenement: " + nomEvent);
                }
             }
             catch(SQLException e){
                System.out.println("Erreur" + e.getMessage());
             }
             return listCategorie;
    }

    public static void main(String[] args) {
        RequeteEvent requeteEvent = new RequeteEvent();

        // String nomEvent = "Mariage";
        // Evenement event = new Evenement(nomEvent);
        // requeteEvent.createEvenement(event);
        requeteEvent.readEvent();
    }
}
