package admin;

import connection.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import admin.Admin;

public class RequetAdmin {
    public List<Admin>  getAdmin() {
        List<Admin> admins= new ArrayList<>();
        String query = "SELECT * FROM Admins";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            // Parcourir les résultats
            while (resultSet.next()) {
                String nomAdmins = resultSet.getString("nomAdmins");
                String email = resultSet.getString("email");
                String mdp = resultSet.getString("mdp");

                Admin admi = new Admin(nomAdmins, email, mdp);
                admins.add(admi);

                // Afficher les données (ou les traiter selon vos besoins)
                System.out.println("Nom admin: " + nomAdmins);
                System.out.println("mdp: " + email);
                System.out.println("Descriptions: " + mdp);
                //System.out.println("Nom Category: " + nomCategory);
                System.out.println("----------------------------");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return admins;
    }
    public static void main(String[] args) {
        RequetAdmin view = new RequetAdmin();
        view.getAdmin();
    }
}
