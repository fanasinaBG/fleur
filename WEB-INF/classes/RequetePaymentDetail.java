import connection.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale.Category;

public class RequetePaymentDetail {
    public void createPaymentDetail(PaymentDetail detail){
        String sql = "INSERT INTO paymentDetail (numero, idPayment) VALUES (?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1,detail.getNumero());
                stmt.setInt(2,detail.getIdPayment());

                stmt.executeUpdate();  
             }
             catch(SQLException e){
                System.out.println("Erreur lors de l'ajout des details" + e.getMessage());
             }
    }
/* 
    public List<String> readPaymentDetail(){
        List<String> listDetail= new ArrayList<>();
        String sql = "SELECT * FROM paymentDetail ";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
                ResultSet resultSet = stmt.executeQuery();

                while (resultSet.next()) {
                    int num = resultSet.getInt("numero");
                    int idPayment = resultSet.getInt("idPayment");

                    listDetail.add(num + idPayment);
                    System.out.println("Numero du paiement: " + num);
                    System.out.println("Type de paiement: " + idPayment);
                    System.out.println("_____________");
                }
             }
             catch(SQLException e){
                System.out.println("Erreur d'affichage'" + e.getMessage());
             }
             return listDetail;
    }
*/

    public void updatePaymentDetail(PaymentDetail detail){
        String sql = "UPDATE paymentDetail SET numero = ? WHERE id=?";
        try (Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {    
                stmt.setInt(1, detail.getNumero());  
                stmt.setInt(2, detail.getId());    
                stmt.executeUpdate();  
            }
            catch(SQLException e){
                System.out.println("Erreur lors de la mise à jour" + e.getMessage());
            }
    } 
    
    public void updatePaymentDetails(PaymentDetail detail){
        String sql = "UPDATE paymentDetail SET numero = ? WHERE idPayment=?";
        try (Connection conn = DatabaseConnection.getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql)) {    
                stmt.setInt(1, detail.getNumero());  
                stmt.setInt(2, detail.getIdPayment());    
                stmt.executeUpdate();  
            }
            catch(SQLException e){
                System.out.println("Erreur lors de la mise à jour" + e.getMessage());
            }
    } 

    public static void main(String[] args) {
        RequetePaymentDetail requeteDetail = new RequetePaymentDetail();

        int numero = 12345;
        int idPayment = 2;
        System.out.println("gtrdy" + "/" + numero + "/" + idPayment);
        PaymentDetail detail = new PaymentDetail (numero,idPayment);
        // requeteDetail.createPaymentDetail(detail);
        // requetePayment.readPayment();
        requeteDetail.updatePaymentDetail(detail);
        // requetePayment.deletePayment(id);
    }
} 
