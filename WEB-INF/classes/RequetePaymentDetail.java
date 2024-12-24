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
                System.out.println("Erreur d'ajout de l'évènement" + e.getMessage());
             }
    }

    public static void main(String[] args) {
        RequetePaymentDetail requeteDetail = new RequetePaymentDetail();

        // String nomPayment = "Mobile Money";
        int numero = 54312;
        int id = 2;
         PaymentDetail detail = new PaymentDetail ( numero,id);
        requeteDetail.createPaymentDetail(detail);
        // requetePayment.readPayment();
        // requetePayment.updatePayment(payement);
        // requetePayment.deletePayment(id);
    }
}
