package payment;

import connection.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import payment.PaymentDetails;

public class RequettePDetails {
     public  List<PaymentDetails>  fetchPDetails(){
        List<PaymentDetails> paymentDetails= new ArrayList<>();
        String query = "SELECT * FROM paymentDetails";

          try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            // Parcourir les résultats
            while (resultSet.next()) {
                String cart = resultSet.getString("cart");
                String numeroCart = resultSet.getString("numeroCart");
                int idPayment = resultSet.getInt("idPayment");
                // String nomCategory = resultSet.getString("nomCategory");
                PaymentDetails details = new PaymentDetails(cart , numeroCart );
                paymentDetails.add(details);

                // Afficher les données (ou les traiter selon vos besoins)
                System.out.println("le cart est: " + cart);
                System.out.println("numero: " + numeroCart);
                System.out.println("----------------------------");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return paymentDetails;
    }

   

    public static void main(String[] args){
        RequettePDetails payments= new RequettePDetails();
        payments.fetchPDetails();
    }

}

