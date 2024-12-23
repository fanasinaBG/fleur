package client;

import connection.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;



public class RequeteClient {
    public void createClient(Clients client){
        String sql = "INSERT INTO clients (nomClient, email, mdp) VALUES (?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1,client.getNomClient());
                stmt.setString(2,client.getEmail());
                stmt.setString(3,client.getMdp());
                stmt.executeUpdate(); 
             }
             catch(SQLException e){
                System.out.println("Erreur" + e.getMessage());
             }
    }

    public static void main(String[] args) {
        RequeteClient requete = new RequeteClient();
        String Nom = "anarana";
        String Email = "mail";
        String mdp = "123";

        Clients client = new Clients(Nom,Email,mdp);

        requete.createClient(client);

        System.out.println("clien enregistrer avec" + Nom + "et email:" + Email + "et mdp:"+mdp);
    }
}

