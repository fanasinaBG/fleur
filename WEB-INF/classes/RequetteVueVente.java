package vente;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.Date;
import connection.DatabaseConnection;

public class RequetteVueVente {
    public List<VueVente> getVente() {
        List<VueVente> livraisons = new ArrayList<>();
        String query = "SELECT * FROM vue_ventes_completes";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            // Parcourir les résultats
            while (resultSet.next()) {
                int id_vente = resultSet.getInt("id_vente");
                String nom_client = resultSet.getString("nom_client");
                int id_fleur = resultSet.getInt("id_fleur");
                String nom_fleur = resultSet.getString("nom_fleur");
                int prix_fleur = resultSet.getInt("prix_fleur");
                String images_fleur = resultSet.getString("images_fleur");
                int id_Client = resultSet.getInt("id_Client");
                Date date = resultSet.getDate("Date");

                // Création de l'objet VueVente avec les résultats de la requête
                VueVente vente = new VueVente(id_vente, nom_client, id_fleur, nom_fleur, prix_fleur, images_fleur, id_Client, date);
                livraisons.add(vente);

                System.out.println("id vente " + id_vente);
                System.out.println("fleur " + nom_fleur);

            }
        } catch (SQLException e) {
            e.printStackTrace();  // Capturer et afficher l'erreur si une exception SQL se produit
        }

        return livraisons;
    }

    public int getRemise(){
        int remise=0;
        String query = "SELECT * FROM remise";

        try (Connection connection = DatabaseConnection.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        ResultSet resultSet = preparedStatement.executeQuery()) {

       // Parcourir les résultats
       while (resultSet.next()) {
           int remis = resultSet.getInt("remise");

                // Création de l'objet VueVente avec les résultats de la requête
                 remise = remis;

                 System.out.println("le remise est" + remis);
                
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Capturer et afficher l'erreur si une exception SQL se produit
        }
        return remise;
    }

     // Fonction pour obtenir la somme des prix des fleurs pour chaque client
     public int getTotalPriceForClient(int idClient) {
        int totalPrice = 0;

        String sql = "SELECT SUM(prix_fleur) AS total_price "
                   + "FROM vue_ventes_completes "
                   + "WHERE id_Client = ?";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Définir le paramètre idClient dans la requête
            stmt.setInt(1, idClient);

            // Exécuter la requête et récupérer le résultat
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                totalPrice = rs.getInt("total_price");
            }

        } catch (SQLException e) {
            System.out.println("Erreur lors de la récupération de la somme des prix : " + e.getMessage());
        }

        return totalPrice;
    }

    public Map<String, Integer> getTotalPricesPerClient() {
    Map<String, Integer> clientTotalPrices = new HashMap<>(); // Stocke la somme des prix par ID client
    String query = "SELECT nom_client, SUM(prix_fleur) AS total_price "
                 + "FROM vue_ventes_completes "
                 + "GROUP BY nom_client";

        int remise=getRemise();

    try (Connection connection = DatabaseConnection.getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(query);
         ResultSet resultSet = preparedStatement.executeQuery()) {

        // Parcourir les résultats
        while (resultSet.next()) {
            String Client = resultSet.getString("nom_client");
            int totalPrice = resultSet.getInt("total_price");
            // String Client = resultSet.getString("nom_client");
            if (totalPrice>=remise) {
                System.out.println("Client:"+ Client + "prix" + totalPrice);

                clientTotalPrices.put(Client, totalPrice);
            }

            // Ajouter l'ID client et le total à la map
            

            // Affichage dans la console pour vérifier
            System.out.println("ID Client: " + Client + " - Total Prix: " + totalPrice );
        }

    } catch (SQLException e) {
        System.out.println("Erreur lors de la récupération des totaux : " + e.getMessage());
    }

    return clientTotalPrices;
}

// public List<VueVente> getTotalPricesPerClientWithNames() {
//     List<VueVente> clientTotals = new ArrayList<>();
//     String query = "SELECT id_Client, nom_client, SUM(prix_fleur) AS total_price "
//                  + "FROM vue_ventes_completes "
//                  + "GROUP BY id_Client, nom_client";

//     try (Connection connection = DatabaseConnection.getConnection();
//          PreparedStatement preparedStatement = connection.prepareStatement(query);
//          ResultSet resultSet = preparedStatement.executeQuery()) {

//         // Parcourir les résultats
//         while (resultSet.next()) {
//             int idClient = resultSet.getInt("id_Client");
//             String nomClient = resultSet.getString("nom_client");
//             int totalPrice = resultSet.getInt("total_price");

//             // Ajouter les données dans la liste
//             clientTotals.add(new VueVente(idClient, nomClient, totalPrice));

//             // Affichage dans la console pour vérifier
//             System.out.println("ID Client: " + idClient + ", Nom Client: " + nomClient + ", Total Prix: " + totalPrice);
//         }

//     } catch (SQLException e) {
//         System.out.println("Erreur lors de la récupération des totaux : " + e.getMessage());
//     }

//     return clientTotals;
// }



    public static void main(String[]args){
        RequetteVueVente vente=new RequetteVueVente();
        // vente.getRemise();
        //vente.getVente();
        vente.getTotalPricesPerClient();
    }
}
