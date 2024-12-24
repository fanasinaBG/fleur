import connection.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale.Category;

public class RequetePayment {
    public void createPayment(Payment payement){
        String sql = "INSERT INTO payment (nomPayment) VALUES (?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1,payement.getNomPayment());

                stmt.executeUpdate();  
             }
             catch(SQLException e){
                System.out.println("Erreur d'ajout de l'évènement" + e.getMessage());
             }
    }

    public List<String> readPayment(){
        List<String> listPayement= new ArrayList<>();
        String sql = "SELECT * FROM payment ";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
                ResultSet resultSet = stmt.executeQuery();

                while (resultSet.next()) {
                    String nomPayement = resultSet.getString("nomPayment");

                    listPayement.add(nomPayement);
                    System.out.println("Type de payement: " + nomPayement);
                }
             }
             catch(SQLException e){
                System.out.println("Erreur de lecture" + e.getMessage());
             }
             return listPayement;
    }

    public void updatePayment(Payment payement){
        String sql = "UPDATE payment SET nomPayment = ? WHERE id=?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {    
                stmt.setString(1, payement.getNomPayment());  
                stmt.setInt(2, payement.getId());    
                stmt.executeUpdate();  
             }
             catch(SQLException e){
                System.out.println("Erreur lors de la mise à jour" + e.getMessage());
             }
    } 

    public void deletePayment(int id){
        String sql = "DELETE FROM payment WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {    
                stmt.setInt(1, id);    
                stmt.executeUpdate();  
             }
             catch(SQLException e){
                System.out.println("Erreur de suppression" + e.getMessage());
             }
    }

    public static void main(String[] args) {
        RequetePayment requetePayment = new RequetePayment();

        // String nomPayment = "Mobile Money";
        // String nomPayment = "Carte Visa";
        int id = 3;
        //  Payment payement = new Payment (id, nomPayment);
        // requetePayment.createPayment(payement);
        // requetePayment.readPayment();
        // requetePayment.updatePayment(payement);
        requetePayment.deletePayment(id);
    }

}
